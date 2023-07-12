<template>
    <Header />
    
    <main>
        <Posts />
    </main>

    <Footer />
</template>
<script>
import axios from 'axios';
import { defineComponent } from 'vue';
import Header from '../components/Header.vue';
import Footer from '../components/Footer.vue';
import Posts from '../components/Post/Posts.vue';
export default defineComponent({
  name: 'Post',
  setup() {
    return {
    };
  },
    components: {
        Header,
        Posts,
        Footer
    }
});

</script>
<style scoped>

main {
    min-height: 90vh;
}
</style>