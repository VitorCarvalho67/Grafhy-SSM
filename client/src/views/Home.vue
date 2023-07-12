<template>
    <div id="app">
      <Header />
        <Slides />
        <Cards />
        <Mapa />
      <Footer />
      
      <router-view />
    </div>    
</template>
  
<script>

import Header from '../components/Header.vue';
import Slides from '../components/Slides.vue';
import Cards from '../components/Cards.vue';
import Mapa from '../components/Mapa.vue';
import Footer from '../components/Footer.vue';

export default {
  name: 'App',
  components: {
    Header,
    Slides,
    Cards,
    Mapa,
    Footer
  }
}

</script>
  