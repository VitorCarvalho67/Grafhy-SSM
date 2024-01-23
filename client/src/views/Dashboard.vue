<template>
    <div id="app">
        <Header />

        <main>
            <div class="box">
                <h1>Hello to the dashboard</h1>
                <h2>{{ userEmail }}</h2>

                <!-- Exibir solicitações -->
                <ul class="solicitations">
                    <li v-for="(solicitation, index) in solicitations" :key="index">
                        Solicitação de: {{ solicitation.name_users }}
                        <button class="accept" @click="respondToSolicitation(solicitation.id_users1, true)">Aceitar</button>
                        <button class="reject"
                            @click="respondToSolicitation(solicitation.id_users1, false)">Recusar</button>
                    </li>
                </ul>

                <form class="solicitation">
                    <p>Email do usuário para solicitar:</p>
                    <input type="email" v-model="email">
                    <button type="button" @click="sendSolicitation">Solicitar</button>
                </form>


                <div class="box-router">
                    <p>Area de postagens de novos comunicados.</p>
                    <router-link to="/admin">Admin</router-link>
                </div>
            </div>
            <div class="box">
                <div v-if="contacts && contacts.length" class="contacts">
                    <h1>Contatos</h1>
                    <ul>
                        <li v-for="(contact, index) in contacts" :key="index">
                            <router-link :to="{ name: 'Private', params: { userId: contact.id_users1 } }">{{
                                contact.name_users }}</router-link>
                        </li>
                    </ul>
                </div>
            </div>
        </main>

        <Footer />

        <router-view />
    </div>
</template>
  
<script>
import auth from '../mixins/auth';
import axios from 'axios';
import Header from '../components/Header.vue';
import Footer from '../components/Footer.vue';
import { loginUser } from '../services/api';
import Img1 from '../assets/imgs/img2.jpg';

export default {
    name: 'Dashboard',
    mixins: [auth],
    components: {
        Header,
        Footer
    },
    data() {
        return {
            userEmail: null,
            password: null,
            email: null,  // email do usuário para o qual enviar a solicitação
            user: null,  // ID do usuário logado
            img: Img1,
            solicitations: null, // solicitações para o usuário logado
            contacts: null,
        };
    },
    methods: {
        checkUser() {
            if (!this.userEmail) {
                this.$router.push({ name: 'Login' });
            } else {
                const user = {
                    email_users: this.userEmail,
                    password_users: this.password
                };
                loginUser(user)
                    .then(response => {
                        console.log(response);
                    })
                    .catch(error => {
                        this.$router.push({ name: 'Login' });
                    });
            }
        },
        async fetchUserIdByEmail(email) {
            try {
                const response = await axios.get(`http://localhost:8000/users/email/${email}`);
                return response.data.id_users;
            } catch (err) {
                console.error('Erro ao buscar usuário', err);
                return null;
            }
        },
        async fetchLoggedInUserId() {
            this.user = await this.fetchUserIdByEmail(this.userEmail);
        },
        async fetchSolicitations() {
            try {
                const response = await axios.get(`http://localhost:8000/solicitation/${this.user}`);
                const solicitations = response.data;
                for (let solicitation of solicitations) {
                    const userResponse = await axios.get(`http://localhost:8000/users/id/${solicitation.id_users1}`);
                    solicitation.name_users = userResponse.data.name_users;
                }
                this.solicitations = solicitations;
            } catch (err) {
                console.error('Erro ao buscar solicitações', err);
            }
        },

        async sendSolicitation() {
            const otherUserId = await this.fetchUserIdByEmail(this.email);
            if (this.user && otherUserId) {
                try {
                    const response = await axios.post(`http://localhost:8000/solicitation/`, {
                        id_users1: this.user,
                        id_users2: otherUserId
                    });
                    console.log('Solicitação enviada com sucesso', response.data);
                    alert('Solicitação enviada com sucesso!');  // Adicionar um alerta
                    this.email = '';  // Limpar o campo de email
                    this.fetchSolicitations();  // Atualizar as solicitações após enviar uma nova
                } catch (err) {
                    console.error('Erro ao enviar solicitação', err);
                    alert('Erro ao enviar solicitação. Tente novamente.');  // Adicionar um alerta para o caso de erro
                }
            } else {
                console.error('Um ou ambos os IDs de usuário não foram encontrados');
                alert('Usuário não encontrado. Verifique o email digitado.');  // Adicionar um alerta para o caso de usuário não encontrado
            }
        },
        
        async respondToSolicitation(user1, resposta) {
            console.log(user1, this.user, resposta)
            try {
                const solicitationResponse = await axios.post(`http://localhost:8000/solicitation/accept`, {
                    id_users1: user1,
                    id_users2: this.user,
                    response: resposta
                });
                console.log('Resposta à solicitação enviada com sucesso', solicitationResponse.data);
                this.fetchSolicitations();  // atualizar as solicitações após responder
            } catch (err) {
                console.error('Erro ao responder à solicitação', err);
            }
        },
        async fetchContacts() {
            try {
                const response = await axios.get(`http://localhost:8000/contacts/${this.user}`);
                const contacts = response.data;
                for (let contact of contacts) {
                    const userResponse = await axios.get(`http://localhost:8000/users/id/${contact.id_users1}`);
                    contact.name_users = userResponse.data.name_users;
                }
                this.contacts = contacts;
            } catch (err) {
                console.error('Erro ao buscar contatos', err);
            }
        },
    },
    async created() {
        this.userEmail = JSON.parse(localStorage.getItem('user'));
        this.password = JSON.parse(localStorage.getItem('password'));
        this.checkUser();
        await this.fetchLoggedInUserId();
        await this.fetchSolicitations();
        await this.fetchContacts();
    },
};
</script>
  


<style scoped>
h1,
h2,
h3 {
    color: white;
}

h1 {
    color: rgb(68, 182, 102);
}

main {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    align-items: center;
    height: 90vh;
}

.box {
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    align-items: center;
    width: 40%;
    height: 80%;
    border: 1px solid rgb(68, 75, 77);
    border-radius: 5px;
    background-color: rgb(30, 32, 33);
    color: rgb(197, 197, 197);
}

.box img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.box-router {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    padding: 2rem;
    width: 100%;
}

.box-router a {
    text-decoration: none;
    padding: 10px;
    margin: 5px;
    border-radius: 5px;
    transition: all 0.3s ease;
    border: 1px solid rgb(68, 75, 77);
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    letter-spacing: 0.1rem;
}

.box-router a:hover {
    background-color: rgb(30, 32, 33);
    color: rgb(197, 197, 197);
}

.box p {
    padding: 0.5rem;
    font-size: 11px;
}

.box:nth-child(2) {
    background-image: url('../assets/imgs/img2.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}

.contacts {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-around;
    width: 100%;
    height: 100%;
}

.contacts h1 {
    color: rgb(255, 255, 255);
    padding: 1.2rem;
    letter-spacing: 0.5rem;
    width: 100%;
    backdrop-filter: blur(5px);
    background-color: #00000068;
    text-align: center;
}

.contacts ul {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-around;
    width: 100%;
    height: 80%;
}

.contacts ul li {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: start;
    width: 95%;
    backdrop-filter: blur(5px);
    padding: 1rem;
    border: rgb(68, 75, 77) 1px solid;
    border-radius: 5px;
    background-color: #00000068;
}

.contacts ul li a {
    text-decoration: none;
    color: white;
    font-size: 1.5rem;
    font-weight: bold;
    transition: all 0.3s ease;
}

/* Estilos para a lista de solicitações */
ul.solicitations {
    list-style-type: none;
    padding: 0;
}

/* Estilos para cada item da lista de solicitações */
ul.solicitations li {
    margin: 10px 0;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* Estilos para os botões "Aceitar" e "Recusar" */
ul.solicitations button {
    margin-left: 10px;
    padding: 5px 10px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

/* Estilos específicos para o botão "Aceitar" */
ul.solicitations button.accept {
    background-color: #4caf4fcc;
    color: white;
}

/* Estilos específicos para o botão "Recusar" */
ul.solicitations button.reject {
    background-color: #f44336da;
    color: white;
}

form.solicitation {
    margin-top: 20px;
    display: flex;
    width: 70%;
    flex-direction: column;
    align-items: flex-start;
}

/* Estilos para o campo de entrada de email */
form.solicitation input[type="email"] {
    margin-bottom: 10px;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

/* Estilos para o botão de envio */
form.solicitation button {
    padding: 5px 10px;
    border: none;
    border-radius: 3px;
    background-color: #4caf50;
    color: white;
    cursor: pointer;
}

/* Estilos para o botão de envio ao passar o mouse */
form.solicitation button:hover {
    background-color: #45a049;
}
</style>
