<template>
    <div class="activePublic">
        <el-radio-group v-model="labelPosition" size="small">
            <el-radio-button label="left">左对齐</el-radio-button>
            <el-radio-button label="right">右对齐</el-radio-button>
            <el-radio-button label="top">顶部对齐</el-radio-button>
        </el-radio-group>
<div style="margin: 20px;"></div>
<el-form :label-position="labelPosition" label-width="80px" :model="garden">
  <el-form-item label="园林code">
    <el-input v-model="garden.gardencode"></el-input>
  </el-form-item>
  <el-form-item label="园林名称">
    <el-input v-model="garden.gardenname"></el-input>
  </el-form-item>
  <el-button v-on:click="submitForm" type="primary" class="pbutton" round >提交园林</el-button>
</el-form>

    </div>

</template>

<script>
// import hello from '../../components/HelloWorld.vue'
export default {
//   components: {
//     hello
//   },
  data () {
    return {
      labelPosition: 'left',
      garden: {
        gardencode: '',
        gardenname: ''

      }
    }
  },
  methods: {
    submitForm: function (event) {
      let self = this
      self.$axios.post('/api/garden/addGarden', this.garden).then(res => {
        if (res.data.code) {
          alert('提交成功')
          self.garden = {}
        } else {
          alert('提交失败')
        }
      })
      //   self.$router.push('/home/activeManage')
    }
  }
}
</script>

<style>
.activePublic {
  width: 600px;
  padding-left: 200px;
}
.pbutton {
  float: right;
  margin-right: 30px;
}
</style>
