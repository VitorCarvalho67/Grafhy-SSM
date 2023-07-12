export default {
    computed: {
      isAuthenticated() {
        // Adicione aqui a lógica para verificar se o usuário está autenticado
        // Você pode usar Vuex ou qualquer outro mecanismo de controle de autenticação
        return true; // Exemplo: considera o usuário autenticado sempre
      },
    },
    beforeRouteEnter(to, from, next) {
      if (!this.isAuthenticated) {
        next('/login');
      } else {
        next();
      }
    },
    beforeRouteUpdate(to, from, next) {
      if (!this.isAuthenticated) {
        next('/login');
      } else {
        next();
      }
    },
  };