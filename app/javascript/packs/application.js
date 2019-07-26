import Vue from 'vue/dist/vue.esm.js'
import BootstrapVue from 'bootstrap-vue';
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';
import Articles from './articles/index.vue';
import Users from './articles/index.vue';

var app = new Vue({
  el: '#app',
  components: {
    Articles
  }
});
