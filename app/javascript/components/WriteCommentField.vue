<template>
  <div>
    <b-field label="Comment" :label-position="labelPosition">
      <b-input type="text"></b-input>
    </b-field>
  </div>
</template>

<script>
export default {
  name: "write-comment",
  data() {
    return {
      labelPosition: "on-border",
    };
  },
};
</script>


