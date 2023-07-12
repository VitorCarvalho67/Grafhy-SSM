<template>
    <!-- quero cards na minha pagina um do lado do outro em forma de retangulos em pé -->
    <H1>
        Cards
    </H1>
    <div class="cards">
        <div class="card">
            <h3>Card 1</h3>
            <p>Some text</p>
            <p>Some text</p>
        </div>
        <div class="card">
            <h3>Card 2</h3>
            <p>Some text</p>
            <p>Some text</p>
        </div>
        <div class="card">
            <h3>Card 3</h3>
            <p>Some text</p>
            <p>Some text</p>
        </div>
        <div class="card">
            <h3>Card 4</h3>
            <p>Some text</p>
            <p>Some text</p>
        </div>
    </div>
</template>
<script>
import { defineComponent } from 'vue';
export default defineComponent({
    name: 'Cards'
});

</script>
<style scoped>
h1 {
    text-align: center;
    padding: 10px;
    color: white;
}
.cards {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    align-items: center;
    margin: 0 auto;
    width: 100%;
    padding: 0 20px;
}

.card {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 20%;
    max-width: 20%;
    height: 300px;
    background-color: rgb(53, 57, 59);
    color: #ccc;
    border-radius: 5px;
    padding: 20px;
    margin: 10px;
}

.card h3 {
    margin: 0;
}

.card p {
    margin: 0;
}

</style>