<template>
    <div>
        <Header />

        <main>
            <!-- Exibir todas as mensagens -->
            <div v-if="messages && messages.length" class="outer-container">
                <ul class="mensagens" ref="messageContainer">
                    <li v-for="(message, index) in messages" :key="index"
                        :class="message.id_users1 === userId ? 'sent' : 'received'">
                        <p class="mensagem">{{ message.message }}</p>
                        <p class="data">{{ formatDate(message.date_message) }}</p>
                    </li>
                </ul>
            </div>

            <!-- Adicionar nova mensagem -->
            <div class="input-box">
                <input type="text" v-model="newMessage" placeholder="Digite sua mensagem aqui" @keyup.enter.prevent="sendMessage">
                <button @click="sendMessage">Enviar</button>
            </div>

        </main>

        <Footer />
    </div>
</template>
  
<script>
import axios from 'axios';
import Header from '../components/Header.vue';
import Footer from '../components/Footer.vue';
import { defineComponent, ref } from 'vue';
import { useRoute } from 'vue-router';
import { loginUser } from '../services/api';

export default defineComponent({
    components: {
        Header,
        Footer
    },
    data() {
        return {
            userEmail: null,
            password: null,
            userId: null,  // ID do usuário logado
            contactId: null,  // ID do contato
            newMessage: '',  // nova mensagem a ser enviada
            messages: null  // mensagens a serem exibidas
        };
    },
    watch: {
        messages: {
            immediate: true,
            handler() {
                this.$nextTick(() => {
                    this.$refs.messageContainer.scrollTop = this.$refs.messageContainer.scrollHeight;
                });
            },
        },
    },
    methods: {
        // Restante do seu código

        async sendMessage() {
            try {
                const response = await axios.post(`http://localhost:8000/message_user/`, {
                    id_users1: this.userId,
                    id_users2: this.contactId,
                    message: this.newMessage,
                    date_message: new Date().toISOString()
                });
                console.log('Mensagem enviada com sucesso', response.data);
                this.fetchMessages();  // atualizar as mensagens após enviar uma nova
                this.newMessage = '';  // limpar o campo de input
            } catch (err) {
                console.error('Erro ao enviar mensagem', err);
            }
        },
        formatDate(date) {
            const now = new Date();
            const messageDate = new Date(date);

            // Se a mensagem foi enviada hoje
            if (now.toDateString() === messageDate.toDateString()) {
                return messageDate.toLocaleTimeString('pt-BR', { hour: '2-digit', minute: '2-digit' });
            }
            // Se a mensagem foi enviada em um dia anterior
            else {
                return messageDate.toLocaleString('pt-BR', { day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit' });
            }
        },

        async fetchMessages() {
            try {
                const response = await axios.get(`http://localhost:8000/message_user/${this.userId}/${this.contactId}`);
                let uniqueMessages = Array.from(new Set(response.data.map(JSON.stringify))).map(JSON.parse);

                // Classificar mensagens por data de envio
                uniqueMessages.sort((a, b) => new Date(a.date_message) - new Date(b.date_message));

                this.messages = uniqueMessages;
            } catch (err) {
                console.error('Erro ao buscar mensagens', err);
            }
        },


        async fetchLoggedInUserId() {
            try {
                const response = await axios.get(`http://localhost:8000/users/email/${this.userEmail}`);
                this.userId = response.data.id_users;
                return this.userId;
            } catch (err) {
                console.error('Erro ao buscar o ID do usuário logado', err);
            }
        },

        async checkUser() {
            if (!this.userEmail) {
                console.log("Saída 1");
            } else {
                const user = {
                    email_users: this.userEmail,
                    password_users: this.password
                };
                try {
                    await loginUser(user);
                    this.fetchMessages();
                } catch (error) {
                    console.log("Saída 2");
                }
            }
        }
    },
    async created() {
        this.userEmail = JSON.parse(localStorage.getItem('user'));
        this.password = JSON.parse(localStorage.getItem('password'));
        this.contactId = this.$route.params.userId;
        this.checkUser();
        await this.fetchLoggedInUserId();
        this.fetchMessages();
    }
});
</script>
  
<style scoped>
main {
    min-height: 90vh;
}


.sent {
    background-color: rgba(33, 63, 33, 0.446);
    border-radius: 10px 0px 10px 10px;

}

.received {
    background-color: rgba(35, 67, 78, 0.361);
    border-radius: 0px 10px 10px 10px;
}

.outer-container {
    height: 60vh;
    overflow-y: auto;
    margin: 2rem;
    padding: 2rem;
    border: 1px solid rgb(68, 75, 77);
    border-radius: 5px;
}

.mensagens {
    height: 100%;
    padding: 20px;
    overflow: scroll-y;
}

.input-box {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    margin: 2rem;
    padding: 2rem;
    height: 20vh;
    border: 1px solid rgb(68, 75, 77);
    border-radius: 5px;
}

.input-box input {
    margin: 0.5rem;
    padding: 0.5rem;
    width: 20rem;
    border-radius: 5px;
    border: 1px solid rgb(68, 75, 77);
}

.input-box button {
    margin: 0.5rem;
    padding: 0.5rem;
    width: 5rem;
    border-radius: 5px;
    border: 1px solid rgb(68, 75, 77);
}

ul li {
    list-style-type: none;
    width: 100%;
    padding: 2rem;
    margin: 1rem;
}

.sent .mensagem {
    width: 100%;
}

.received .data {
    width: 100%;
    text-align: right;
}

.sent .mensagem {
    width: 100%;
    text-align: right;
}

</style>
  