<template>
    <div>
      <input v-model="id_users1" type="number" placeholder="Digite o ID do usuário 1">
      <input v-model="id_users2" type="number" placeholder="Digite o ID do usuário 2">
      <button @click="createSolicitation">Criar Solicitação</button>
      <div v-if="solicitation">
        <h2>Solicitação Criada:</h2>
        <p>ID da solicitação: {{ solicitation.id_solicitation }}</p>
        <p>ID do usuário 1: {{ solicitation.id_users1 }}</p>
        <p>ID do usuário 2: {{ solicitation.id_users2 }}</p>
      </div>
      <div v-if="error">{{ error }}</div>
    </div>
  </template>
  
  <script>
  import { ref } from 'vue'
  import axios from 'axios'
  import { defineComponent } from 'vue'
  
  export default defineComponent({
    name: 'Solicitation',
    setup() {
      const id_users1 = ref(null)
      const id_users2 = ref(null)
      const solicitation = ref(null)
      const error = ref(null)
  
      async function createSolicitation() {
        try {
          const response = await axios.post(`https://apigrafhy.favela.network/solicitation/`, {
            id_users1: id_users1.value,
            id_users2: id_users2.value
          })
          solicitation.value = response.data
        } catch (err) {
          error.value = "Falha ao criar solicitação"
        }
      }
  
      return {
        id_users1,
        id_users2,
        solicitation,
        error,
        createSolicitation
      }
    }
  })
  </script>
  