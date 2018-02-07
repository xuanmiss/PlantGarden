<template>

    <div class="loginback">
        <!-- <div style="margin: 20px;"></div> -->
        <div class="pllogin">
            <el-form :label-position="labelPosition" label-width="80px" :model="formLabelAlign">
            <el-form-item class="logininfo" label="用户名">
            <el-input v-model="formLabelAlign.name"></el-input>
            </el-form-item>
            <el-form-item v-if="register" class="logininfo" label="邮箱">
            <el-input v-model="formLabelAlign.email"></el-input>
            </el-form-item>
            <el-form-item class="logininfo" label="密码">
            <el-input v-model="formLabelAlign.password"></el-input>
            </el-form-item>
            </el-form>
            <el-button v-on:click="regist" type="primary" class="pbutton" round >注册用户</el-button>
            <el-button v-on:click="login" type="primary"  round >登 录</el-button>
        </div>

    </div>
</template>
<script>
  export default {
    data () {
      return {
        labelPosition: 'left',
        register: false,
        formLabelAlign: {
          name: '',
          email: '',
          password: ''
        }
      }
    },
    methods: {
      login: function () {
        let self = this
        self.$axios.post('/api/user/login', this.formLabelAlign).then(res => {
          if (res.data.data.code) {
            // alert('登录成功')
            self.$message({
              duration: 1500,
              message: '恭喜你，登录成功',
              type: 'success'
            })
            sessionStorage.setItem('isLogin', true)
            sessionStorage.setItem('username', self.formLabelAlign.name)
            sessionStorage.setItem('userrole', res.data.data.data.userrole)
            sessionStorage.setItem('userid', res.data.data.data.id)
            sessionStorage.setItem('userpassword', self.formLabelAlign.password)
            console.log(res.data.data.data)
            self.formLabelAlign = {}

            self.$router.push('/plant')
          } else {
            self.$message({
              duration: 1500,
              message: '登录失败，您只能看到园林展示哦',
              type: 'error'
            })
            sessionStorage.clear()
            self.$router.push('/plant')
          }
        })
      },
      regist: function () {
        let self = this
        if (self.register === false) {
          self.register = true
        } else {
          self.$axios
          .post('api/user/add', this.formLabelAlign)
          .then(res => {
            if (res.data.code) {
              self.$message({
                duration: 1500,
                message: res.data.messages,
                type: 'success'
              })
              this.formLabelAlign = {}
              self.register = false
            } else {
              self.$message({
                duration: 1500,
                message: res.data.messages,
                type: 'error'
              })
            }
          })
        }
      }
    }
  }
</script>
<style>
.pllogin{
    width:300px;
    margin-top:250px;
    margin-right: 200px;
    float: right;
}
.logininfo{
    font-style: italic;

    /* font-size:22px; */
}
.pbutton{
    float: right;

    /* margin-right:50px; */
}
body{
    background-image:url("/src/assets/1515587449334黄花.jpeg");
    background-repeat:no-repeat;
    background-size: 100%;
    background-position-y: 40%;
}
</style>
