<template>
    <div class="mapa">
        <div class="box">
            <h2>Kapellbrücke</h2>
            <p>A Kapellbrücke é uma ponte de madeira em Lucerna, Suíça. A Kapellbrücke foi erigida em 1365. Na ponta sul da
                ponte fica a Wasserturm. Bem alto, nas traves de madeira encontram-se 112 pinturas datadas do início do
                século XVII e restauradas no princípio do século XX.</p>
        </div>
        <div class="box">
            <h2>Mapa</h2>
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d682334.9919177336!2d5.295357588492652!3d48.083781663370836!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x478ffb9f30ccc2e5%3A0x20b010d3c1d20e37!2sKapellbr%C3%BCcke!5e0!3m2!1spt-BR!2sbr!4v1689080833019!5m2!1spt-BR!2sbr"
                width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade">
            </iframe>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import { defineComponent, ref, onMounted, nextTick, watch } from 'vue';

export default defineComponent({
    name: 'Mapa'
});
</script>

<style scoped>
.mapa {
    height: 70vh;
    overflow-y: auto;
    margin: 2rem;
    padding: 2rem;
    border: 1px solid #ccc;
    border-radius: 5px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
}

.box {
    height: 85%;
    width: 45%;
    overflow-y: auto;
    margin: 2rem;
    padding: 2rem;
    border: 1px solid #ccc;
    border-radius: 5px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

h2 {
    text-align: center;
    font-size: 2rem;
    margin: 0.5rem;
    padding: 0.5rem;
    overflow: hidden;
}

p {
    text-align: justify;
    font-size: 1rem;
    margin: 0.5rem;
    padding: 0.5rem;
}

iframe {
    border-radius: 0.5rem;
}

</style>