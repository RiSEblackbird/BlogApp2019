<template>
<div class="app">
  <h1>{{ msg }}</h1>
</div>
</template>

<script>
export default {
  name: 'global_footer',
  props: {
    msg: String
  }
}
</script>

<style scoped>
#header{
  background: aliceblue;
}
</style>
