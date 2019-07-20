import Vue from 'vue/dist/vue.esm';
import axios from 'axios';

new Vue({
  el: '#js-users',
  data: {
    userInfo: {},
    userInfoBool: false
  },
  methods: {
    setUserInfo(id){
      axios.get(`api/users/${id}.json`)
        .then(res => {
          this.userInfo = res.data;
          this.userInfoBool = true;
        });
    }
  }
});
