<template>
    <Header />
    <div class="login-box">
      <h2>Login</h2>
      <form @submit="login">
        <input type="email" v-model="email" placeholder="Email" required>
        <input type="password" v-model="password" placeholder="Password" required>
        <div class="button-box">
            <div class="box">
                <button type="submit">Login</button> 
                <router-link class="registrar" to="/register">Register</router-link>
            </div>
        </div>
        </form>
    </div>
    <Footer />
  </template>
  
  <script>
  import router from '../router/index.js'
  import axios from 'axios'
  import Header from '../components/Header.vue'
  import Footer from '../components/Footer.vue'
  
  export default {
    name: 'Login',
    data() {
      return {
        email: '',
        password: ''
      }
    },
    methods: {
      login(event) {
        event.preventDefault()
        axios.post('https://apigrafhy.favela.network/login/', {
          email_users: this.email,
          password_users: this.password
        })
        .then(response => {
            console.log(response)
            localStorage.clear();
            localStorage.setItem('user', JSON.stringify(response.data.email_users))
            localStorage.setItem('password', JSON.stringify(response.data.password_users))

            router.push({ name: 'Dashboard' })

        })
        .catch(error => {
          console.error(error)
          // Tratar erro de login
        })
      }
    },
    components: {
    Header,
    Footer
    }
  }
</script>

<style scoped>
    .login-box {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin: 2rem;
        padding: 2rem;
        height: 85vh;
        border: 1px solid rgb(68, 75, 77);
        border-radius: 5px;
    }

    h2 {
        margin: 0.5rem;
        letter-spacing: 0.1rem;
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    input {
        margin: 0.5rem;
        padding: 0.5rem;
        width: 20rem;
        border-radius: 5px;
        border: 1px solid rgb(68, 75, 77);
    }
    .button-box {
        display: flex;
        flex-direction: row;
        width: 20rem;
        /* quero deixar a div interna para a direita*/
        justify-content: flex-end;
        align-items: center;
    }
    .box {
        display: flex;
        flex-direction: row;
        align-items: center;
        width: 50%;
    }
    button {
        margin: 0.5rem;
        padding: 0.5rem;
        border-radius: 5px;
        border: 1px solid rgb(68, 75, 77);
        background-color: #ccc;
        color: #fff;
        cursor: pointer;
    }
    button:hover {
        background-color: #fff;
        color: #000;
    }
    .registrar {
        font-size: 15px;
        text-decoration: none;
        color: #fff;
    }
</style>
  