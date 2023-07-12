<template>
    <div id="app">
      <Header />
  
      <main>
        <div class="box">
          <h1>Hello to the dashboard</h1>
          <h2>{{ userEmail }}</h2>
          <form>
            <p>Solicitation Email do user:</p>
            <input type="email" v-model="email">
            <button type="button" @click="sendSolicitation">Solicitation</button>
          </form>
  
          <div class="box-router">
            <p>Area de postagens de novos comunicados.</p>
            <router-link to="/admin">Admin</router-link>
          </div>
        </div>
        <div class="box">
          <img :src="img" alt="img1">
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
        img: Img1
      };
    },
    methods: {
      checkUser() {
        if (!this.userEmail) {
          this.$router.push({ name: 'Login' });
          console.log("Saída 1");
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
      async sendSolicitation() {
        const otherUserId = await this.fetchUserIdByEmail(this.email);
        if (this.user && otherUserId) {
          try {
            const response = await axios.post(`http://localhost:8000/solicitation/`, {
              id_users1: this.user,
              id_users2: otherUserId
            });
            console.log('Solicitação enviada com sucesso', response.data);
          } catch (err) {
            console.error('Erro ao enviar solicitação', err);
          }
        } else {
          console.error('Um ou ambos os IDs de usuário não foram encontrados');
        }
      }
    },
    async created() {
      this.userEmail = JSON.parse(localStorage.getItem('user'));
      this.password = JSON.parse(localStorage.getItem('password'));
      this.checkUser();
      await this.fetchLoggedInUserId();
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
    border: 1px solid #ccc;
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
    border: 1px solid white;
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
</style>
