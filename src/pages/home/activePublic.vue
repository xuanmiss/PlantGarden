<template>
    <div class="activePublic">
        <el-radio-group v-model="labelPosition" size="small">
            <el-radio-button label="left">左对齐</el-radio-button>
            <el-radio-button label="right">右对齐</el-radio-button>
            <el-radio-button label="top">顶部对齐</el-radio-button>
        </el-radio-group>
<div style="margin: 20px;"></div>
<el-form :label-position="labelPosition" label-width="80px" :model="user">
  <el-form-item label="姓名">
    <el-input v-model="user.name"></el-input>
  </el-form-item>
  <el-form-item label="E-mail">
    <el-input v-model="user.email"></el-input>
  </el-form-item>
  <el-form-item label="密码">
    <el-input v-model="user.password"></el-input>
  </el-form-item>
  <el-button v-on:click="submitForm" type="primary" class="pbutton" round >提交用户</el-button>
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
      user: {
        name: '',
        email: '',
        password: ''
      }
    }
  },
  methods: {
    submitForm: function (event) {
      let self = this
      self.$axios.post('/api/user/add', this.user).then(res => {
        if (res.data.code) {
          alert('提交成功')
          self.user = {}
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
