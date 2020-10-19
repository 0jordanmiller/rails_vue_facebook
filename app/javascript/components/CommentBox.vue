<template>
  <div>
    <div class="box" v-for="comment in comments[index]" :key="comment.id">
      {{ comment.comment }}
    </div>
  </div>
</template>

<script>
export default {
  name: "CommentBox",
  props: ["comments", "index"],
};
</script>