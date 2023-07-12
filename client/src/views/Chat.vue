<template>
    <Header />
    <Teste />
    <Footer />
  </template>
  
  <script>

  import Header from '../components/Header.vue'
  import Footer from '../components/Footer.vue'
  import Teste from '../components/chat/Teste.vue'

  export default {
    name: 'Chat',

    components: {
    Header,
    Teste,
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
    input {
        margin: 0.5rem;
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
  