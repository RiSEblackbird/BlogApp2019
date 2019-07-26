import VueRouter from 'vue-router';
import Articles from './articles/index.vue'
import Users from './users/index.vue'

Vue.use(VueRouter);

const routes = [
  {path: '/', component: Articles},
  {path: '/users', component: Users}
];

export default new VueRouter({ routes });
