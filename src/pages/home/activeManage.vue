<template>
    <div>
    <el-table
    class="usertable"
    :data="tableData"
    stripe: true
    style="width: 1100px ">
    <el-table-column
      prop="name"
      label="姓名"
      width="330">
    </el-table-column>
    <el-table-column
      prop="email"
      label="Email"
      width="339">
    </el-table-column>
    <el-table-column
      prop="password"
      label="密码"
      width="330">
    </el-table-column>
     <el-table-column
      label="操作"
      width="100">
      <template slot-scope="scope">
        <el-button @click="deleteUser(scope.row)" type="text" size="small">删除</el-button>
        <el-button type="text" size="small" @click="updateUser(scope.row)">编辑</el-button>
      </template>
    </el-table-column>
    </el-table>
    <div>
        <el-dialog
    title="编辑用户"
    :visible.sync="dialogVisible"
    width="30%"
    >
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
         <el-form-item label="权限">
            <el-input v-model="user.userrole"></el-input>
        </el-form-item>
        <el-button v-on:click="handleUpdate" type="primary" class="pbutton" round >提交用户</el-button>
        </el-form>
 </el-dialog>

    </div>
    </div>


</template>

<script>
export default {
  data () {
    return {
      labelPosition: 'left',
      dialogVisible: false,
      user: {
        id: '',
        name: '',
        email: '',
        password: '',
        userrole: ''
      },
      tableData: []
    }
  },
  mounted: function () {
    this.userList()
  },
  methods: {
    userList: function () {
      let self = this
      self.$axios.get('/api/user/getUsers').then(function (res) {
        if (res.data.code) {
          self.tableData = res.data.data
        }
      })
    },
    handleUpdate: function () {
      let self = this
      self.$axios
           .post('/api/user/update', self.user)
           .then(res => {
             if (res.data.code) {
               self.$message({
                 duration: 1500,
                 message: '更新用户成功',
                 type: 'success'
               })
               self.user = {}
               self.dialogVisible = false
               self.userList()
             } else {
               self.$message({
                 duration: 1500,
                 message: '更新用户失败',
                 type: 'error'
               })
             }
           })
    },
    updateUser: function (row) {
      let self = this
      self.dialogVisible = true
      self.getUserInfo(row)
    },
    getUserInfo: function (row) {
      let self = this
      self.$axios
        .get('/api/user/getUserInfo', { params: { id: row.id } })
        .then(res => {
          if (res.data.code) {
            self.user = res.data.data
          }
        })
    },
    deleteUser: function (row) {
      let self = this
      var isdelete = confirm('确定删除？')
      if (isdelete) {
        self.$axios.get('/api/user/deleteUserById', { params: { id: row.id } }).then(function (res) {
          if (res.data.code) {
            alert('删除成功')
              // self.$router.push('/home/activeManage')
              //   location.reload()
            self.userList()
          } else {
            alert('删除失败')
          }
        })
      } else {
        self.userList()
      }
    }
  }
}
</script>

<style>

</style>
