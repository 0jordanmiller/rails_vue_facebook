<template>
  <div id="app">
    <ul>
      <li v-for="post in posts" :key="post.key">{{post.post}}</li>
    </ul>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      posts: gon.posts,
    };
  },
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>