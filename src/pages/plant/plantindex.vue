
<template>
      <div id="planthome">
        <!-- 头部导航 -->
        <!-- <div style="position: relative;height: 60px;width: 100%;"></div> -->
        <mheader></mheader>
        <main>
              <!-- 左侧导航 -->
            <div class="main-left">
              <el-menu default-active="/home" class="el-menu-vertical-demo" @select="getGardenPlants" ><!--:router= "true"-->
                <!-- <el-menu-item index="/home/plantAdd" :class="{'isActive':active}">添加植物</el-menu-item>
                <el-menu-item index="/home/plantList" :class="{'isActive': !active}">植物展示</el-menu-item>
                <el-menu-item index="/home/activePublic" :class="{'isActive': !active}">提交用户</el-menu-item>
                <el-menu-item index="/home/activeManage" :class="{'isActive': !active}">用户列表</el-menu-item> -->

                <el-menu-item class="garden" :index="garden.gardencode" v-for="garden in gardens" :key="garden.id">{{garden.gardenname}}</el-menu-item>
              </el-menu>
            </div>
              <!-- 右侧主内容区 -->
              <div  class="main-right" >
                    <!-- <router-view class="view"></router-view> -->

                    <mplantlist ref="child" v-bind:gardencode="this.gardencode"></mplantlist>
              </div>
        </main>
      </div>
</template>
<script>
import mheader from '../../components/Header.vue'
import mplantlist from '../PlantList.vue'
import mplantinfo from './PlantInfo.vue'
// import hub from '../../components/hub.vue'
export default {
  components: {
    mheader,
    mplantinfo,
    mplantlist
  },
  data () {
    return {
      gardencode: '',
      gardens: [
        // {
        //   id: 1,
        //   gardencode: 'rose',
        //   gardenname: '玫瑰园'
        // }
      ]
    }
  },
  mounted: function () {
    this.gardenList()
  },
  methods: {
    gardenList: function () {
      let self = this
      console.log(self.gardens)
      self.$axios.get('/api/garden/getGardens')
      .then(function (res) {
        if (res.data.code) {
          self.gardens = res.data.data
          console.log(self.gardens)
        }
      })
    //   self.$axios.get('/api/plant/getPlants').then(function (res) {
    //     if (res.data.code) {
    //       self.plants = res.data.data
    //     }
    //   })
    },
    getGardenPlants: function (key, keyPath) {
      let self = this
      self.gardencode = key
      console.log(self.gardencode)
      this.$refs.child.plantList(self.gardencode)
    //   hub.$emit(self.gardencode)
    }
    // flushPlantList () {
    //   hub.$emit(self.gardencode)
    // }
  }
}
</script>
<style>
.col {
  width: 200px;
  /* height: 100%; */
}
.main-left {
  /* height: 800px; */
  background-color: rgb(221, 221, 221);
}
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
#app {
  min-width: 1200px;
  margin: 0 auto;
  /* font-family: "Helvetica Neue", "PingFang SC", Arial, sans-serif; */
}
.garden{
    border-bottom:solid 1px #edeff1;
    /* font-size: 18px; */

}
.garden:nth-child(even){
background: #D3DCE6;
}
/* .garden:nth-child(even):hover{
background: rgb(221, 232, 243);
} */
.garden:last-child{
    border:0;
}
</style>
