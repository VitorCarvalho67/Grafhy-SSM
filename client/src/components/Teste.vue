<template>
    <div>
      <input v-model="email" type="text" placeholder="Digite o email">
      <button @click="getUser">Buscar Usuário</button>
      <div v-if="user">
        <h2>Detalhes do Usuário:</h2>
        <p>Id: {{ user.id_users }}</p>
        <p>Nome: {{ user.name_users }}</p>
        <p>Email: {{ user.email_users }}</p>
        <!-- Adicione mais detalhes conforme necessário -->
      </div>
      <div v-if="error">{{ error }}</div>
    </div>
  </template>
  
  <script>
  import { ref } from 'vue'
  import axios from 'axios'
  import { defineComponent } from 'vue'
  
  export default defineComponent({
    name: 'Teste',
    setup() {
      const email = ref('')
      const user = ref(null)
      const error = ref(null)
  
      async function getUser() {
        try {
          const response = await axios.get(`http://localhost:9999/users/email/${email.value}`)
          user.value = response.data
        } catch (err) {
          error.value = "Usuário não encontrado"
        }
      }
  
      return {
        email,
        user,
        error,
        getUser
      }
    }
  })
  </script>
  