<template>
      <div id="home">
        <!-- 头部导航 -->
        <!-- <div style="position: relative;height: 60px;width: 100%;"></div> -->
        <mheader></mheader>
        <main>
              <!-- 左侧导航 -->
            <div class="main-left">
            <template>
                <el-col :span="8">
                    <el-menu default-active="2" class="el-menu-vertical-demo" :router= "true" @open="handleOpen" @close="handleClose">
                    <el-submenu index="garden">
                        <template slot="title"><i class="el-icon-edit"></i>园林管理</template>
                        <el-menu-item index="/home/gardenAdd">添加园林</el-menu-item>
                       <el-menu-item index="/home/gardenlist">园林列表</el-menu-item>
                    </el-submenu>

                    <el-submenu index="plant">
                        <template slot="title"><i class="el-icon-star-on"></i>植物管理</template>
                        <el-menu-item index="/home/plantAdd">添加植物</el-menu-item>
                        <el-menu-item index="/home/plantList">植物展示</el-menu-item>
                        <el-menu-item index="/home/plantUpdate">植物修改</el-menu-item>
                    </el-submenu>
                    <el-submenu index="forum">
                        <template slot="title"><i class="el-icon-share"></i>动态管理</template>
                        <el-menu-item index="/home/forumList">动态列表</el-menu-item>
                        <!-- <el-menu-item index="/home/forumManage">管理动态</el-menu-item> -->
                    </el-submenu>
                    <el-submenu index="user">
                        <template slot="title"><i class="el-icon-message"></i>用户管理</template>
                        <el-menu-item index="/home/activePublic">添加用户</el-menu-item>
                        <el-menu-item index="/home/activeManage">用户列表</el-menu-item>
                    </el-submenu>
                    <!-- <el-menu-item index="3"><i class="el-icon-setting"></i>导航三</el-menu-item> -->
                    </el-menu>
                </el-col>
            </template>

            </div>


              <!-- 右侧主内容区 -->
              <div  class="main-right" >
                    <router-view class="view"></router-view>
              </div>
        </main>
      </div>
</template>

<script>
import mheader from '../../components/Header.vue'
export default {
  components: {
    mheader
  },
  data: function () {
    return {

    }
  },
  methods: {
    handleOpen (key, keyPath) {
      console.log(key, keyPath)
    },
    handleClose (key, keyPath) {
      console.log(key, keyPath)
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
/* 头部导航 */

.main-left {
  /* height: 800px; */
  background-color: rgb(221, 221, 221);
}
.el-menu .el-menu-item:hover {
  background-color: rgb(178, 206, 230);
}

/* 主内容区 */
main {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  min-height: 800px;
  border: solid 1px #3091f2;
  background-color: #fcfcfc;
}
main .main-left {
  text-align: center;
  width: 200px;
  float: left;
}
main .main-right {
  -webkit-box-flex: 1;
  -ms-flex: 1;
  flex: 1;
  background-color: #fff;
  padding: 50px 30px;
}
main .el-menu {
  background-color: transparent !important;
}
.el-menu-vertical-demo{
    width:200px;
}
</style>
