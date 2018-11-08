<template>
  <div class="login container">
    <h2>Se connecter</h2>
    <Authentification-form :isAlreadyRegistered="true" ></Authentification-form>
  </div>
</template>

<script>
  import AuthentificationForm from "./AuthentificationForm";
  export default {
    name: "Login",
    components: {AuthentificationForm}
  }
</script>

<style scoped>

</style>