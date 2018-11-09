<template>
  <div class="lift-account" @click="$emit('click')">
    <div class="image-container">
      <img src="/images/user_icon.png" alt="user icon">
    </div>
    <div class="account-infos"><span class="name">{{account.first_name}} {{account.last_name}}</span> {{additionalInfo}}</div>
  </div>
</template>

<script>
  export default {
    props: ['account', 'additionalInfo']
  }
</script>

<style lang="scss">
  @import '../styles/colors';

  .lift-account {
    display: flex;
    flex-direction: row;
    align-items: center;
    padding: 15px 20px;
    background-color: $light-grey;
    border-radius: 5px;
    box-shadow: 3px 3px 3px 0 rgba(0, 0, 0, .3);
    transition: box-shadow .3s, transform .3s;
    margin-bottom: 10px;
    cursor: pointer;

    &:hover {
      box-shadow: 5px 5px 5px 0 rgba(0, 0, 0, .3);
      transform: translate(-2px, -2px);
    }

    .image-container {
      width: 50px;
      height: 50px;

      img {
        max-width: 100%;
        max-height: 100%;
      }
    }

    .account-infos {
      padding-left: 20px;
      font-size: 16px;

      .name {
        font-weight: bold;
      }
    }
  }
</style>
