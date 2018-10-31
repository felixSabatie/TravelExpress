<template>
  <div class="register">
    <h2>S'inscrire</h2>
  <authentification-form :isAlreadyRegistered="false" ></authentification-form>
  </div>
</template>

<script>
  import AuthentificationForm from "./authentificationForm";
  export default {
    name: "Register",
    components: {AuthentificationForm}
  }
</script>

<style scoped>

</style>