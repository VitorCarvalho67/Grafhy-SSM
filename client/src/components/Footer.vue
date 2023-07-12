<template>
    <footer>
        <p>© {{ ano }} - Todos os direitos reservados</p>
    </footer>
</template>

<script>
import { defineComponent } from 'vue';
import { useRoute } from 'vue-router';
export default defineComponent({
    name: 'Footer',
    setup() {
        const route = useRoute();
        return {
            route
        }
    },
    data() {
        return {
            ano: new Date().getFullYear()
        }
    }
});

</script>

<style scoped>

footer {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 1rem;
    background-color: rgb(30, 32, 33);
    color: rgb(197, 197, 197);
    bottom: 0;
    height: 100px;
}

</style>