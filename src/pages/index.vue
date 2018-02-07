<template>
    <div id="article">
        <mheader></mheader>
        <main>
            <div class="article">
                
            </div>
        </main>
    </div>
</template>

<script>
import mheader from '../components/Header.vue'
export default {
  components: {
    mheader
  },
  data: function () {
    return {

    }
  }
}
</script>


<style>
body {
  margin: 0;
}
#app {
  min-width: 1200px;
  margin: 0 auto;
  font-family: "Helvetica Neue", "PingFang SC", Arial, sans-serif;
}
main {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  min-height: 800px;
  border: solid 1px #3091f2;
  background-color: #fcfcfc;
}
</style>
