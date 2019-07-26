import Vue from 'vue/dist/vue.esm';
import axios from 'axios';
import BootstrapVue from 'bootstrap-vue';
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';
import Articles_cards from 'packs/components/articles_cards.vue'
import Footer from 'packs/components/footer.vue'

var app = new Vue({
  el: '#app',
  components: {
    Articles_cards
  }
});
