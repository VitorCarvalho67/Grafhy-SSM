<template>
    <Header />
    <div class="register-box">
      <h2>Register</h2>
      <form @submit.prevent="registerUser">
        <div>
          <label for="name">Name:</label>
          <input
            id="name"
            type="text"
            v-model="userData.name_users"
            required
          />
        </div>
        <div>
          <label for="email">Email:</label>
          <input
            id="email"
            type="email"
            v-model="userData.email_users"
            required
          />
        </div>
        <div>
          <label for="password">Password:</label>
          <input
            id="password"
            type="password"
            v-model="userData.password_users"
            required
          />
        </div>
        <div>
          <label for="photo">Photo:</label>
          <input
            id="photo"
            type="text"
            v-model="userData.photo_users"
            required
          />
        </div>
        <button type="submit">Register</button>
      </form>
      <p v-if="errorMessage">{{ errorMessage }}</p>
    </div>
    <Footer />
  </template>
  
  <script>
  import { ref } from 'vue';
  import { registerUser } from '../services/api';
  import Header from '../components/Header.vue';
  import Footer from '../components/Footer.vue';

  export default {
    name: 'Register',
    setup() {
      const userData = ref({
        name_users: '',
        email_users: '',
        password_users: '',
        photo_users: ''
      });
      const errorMessage = ref('');
  
      const performRegistration = async () => {
        try {
          const user = await registerUser(userData.value);
          console.log('User registered:', user);
          // Seu código de redirecionamento ou manipulação de sucesso aqui
        } catch (error) {
          errorMessage.value = error.message;
        }
      };
  
      return {
        userData,
        errorMessage,
        registerUser: performRegistration
      };
    },
    components: {
      Header,
      Footer
    }
  };
  </script>
  
  <style scoped>
    .register-box {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin: 2rem;
        padding: 2rem;
        height: 85vh;
        border: 1px solid #ccc;
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

    form div {
        display: flex;
        flex-direction: column;
        margin: 0.5rem;
    }
    input {
        padding: 0.5rem;
        width: 20rem;
        border-radius: 5px;
        border: 1px solid #ccc;
    }
    button {
        margin: 0.5rem;
        padding: 0.5rem;
        border-radius: 5px;
        border: 1px solid #ccc;
        background-color: #ccc;
        color: #fff;
        cursor: pointer;
    }
    button:hover {
        background-color: #fff;
        color: #000;
    }
  </style>
  