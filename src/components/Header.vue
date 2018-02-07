<template>
  <div id="mheader">
        <!-- 头部导航 -->
        <header class="header">
        <el-row>
            <el-col :span="24">
              <el-menu default-active="5" class="el-menu-demo" :router="true" mode="horizontal" @select="">
                <el-menu-item index="/">首页</el-menu-item>
                <el-menu-item index="/plant">园林展示</el-menu-item>
                <el-menu-item index="/forum" v-if="isLogin" @click="flushUrl">植物讨论</el-menu-item>
                <el-menu-item index="/home" v-if="role">后台管理</el-menu-item>
                <el-menu-item index="/login">用户登录</el-menu-item>

              </el-menu>
            </el-col>
        </el-row>
        </header>
  </div>
</template>
<script>
export default {
  data () {
    return {
      isLogin: false,
      role: false
    }
  },
  mounted: function () {
    let self = this
    if (sessionStorage.getItem('userrole') === 'admin') {
      self.role = true
    } else {
      self.role = false
    }
    if (sessionStorage.getItem('isLogin')) {
      self.isLogin = true
    }
  },
  methods: {
    flushUrl: function () {
      location.reload()
    }
    // validRole: function () {
    //   var sessionStorage
    // }
    // handleSelect (key, keyPath) {
    //   this.$router.push(keyPath)
    // }
  }
}
</script>

<style>
#app {
  min-width: 1200px;
  margin: 0 auto;
  font-family: "Helvetica Neue", "PingFang SC", Arial, sans-serif;
}
/* 头部导航 */
header {
  z-index: 1000;
/* background: red; */
  min-width: 1200px;
  transition: all 0.5s ease;
  border-top: solid 1px #3091f2;
  box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.12), 0 0 6px 0 rgba(0, 0, 0, 0.04);
}
header.header-fixed {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
}
.el-menu-demo {
  /* background-color: rgb(221, 221, 221);
   */
  background-image:url("/src/assets/head1.jpg");
    /* background-repeat:no-repeat; */
    background-size: 100%;
    background-position-y: 40%;
   /* background: #3091f2 */
}
.el-menu .el-menu-item:hover {
  background-color: rgb(211, 195, 191);
}
header .el-menu-demo {
  padding-left: 390px !important;

}
header .el-menu-item {
  margin: 0 20px 0 !important;

}
</style>

