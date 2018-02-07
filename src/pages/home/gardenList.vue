<template>
<div>
<el-table
    class="usertable"
    :data="tableData"
    stripe: true
    style="width: 1100px ">
    <el-table-column
      prop="id"
      label="序号"
      width="330">
    </el-table-column>
    <el-table-column
      prop="gardencode"
      label="园林编号"
      width="339">
    </el-table-column>
    <el-table-column
      prop="gardenname"
      label="园林名称"
      width="330">
    </el-table-column>
     <el-table-column
      label="操作"
      width="100">
      <template slot-scope="scope">
        <el-button @click="deleteGarden(scope.row)" type="text" size="small">删除</el-button>
        <el-button type="text" @click="updateGarden(scope.row)" size="small">编辑</el-button>
      </template>
    </el-table-column>

  </el-table>
<div class="gardenup">
    <el-dialog
    title="编辑园林"
    :visible.sync="dialogVisible"
    width="30%"
    >
   <el-form :label-position="labelPosition" label-width="80px" :model="garden">
  <el-form-item label="园林code">
    <el-input style="width:160px; float:left" v-model="garden.gardencode"></el-input>
  </el-form-item>
  <el-form-item label="园林名称">
    <el-input style="width:160px; float:left" v-model="garden.gardenname"></el-input>
  </el-form-item>

</el-form>
    <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleUpdate">确定</el-button>
    </span>
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
      tableData: [],
      garden: {
        id: '',
        gardencode: '',
        gardenname: ''
      }
    }
  },
  mounted: function () {
    this.gardenList()
  },
  methods: {
    gardenList: function () {
      let self = this
      self.$axios.get('/api/garden/getGardens').then(function (res) {
        if (res.data.code) {
          self.tableData = res.data.data
        }
      })
    },
    deleteGarden: function (row) {
      let self = this
      var isdelete = confirm('确定删除？')
      if (isdelete) {
        self.$axios
          .get('/api/garden/deleteGarden', { params: { id: row.id } })
          .then(function (res) {
            if (res.data.code) {
              self.$message({
                duration: 1500,
                message: '删除成功',
                type: 'success'
              })
              // self.$router.push('/home/activeManage')
              //   location.reload()
              self.gardenList()
            } else {
              self.$message({
                duration: 1500,
                message: '删除失败',
                type: 'error'
              })
            }
          })
      } else {
        self.gardenList()
      }
    },
    updateGarden: function (row) {
      let self = this
      //   var isdelete = confirm('确定删除？')
      self.dialogVisible = true
      self.garden.gardencode = row.gardencode
      self.garden.gardenname = row.gardenname
      self.garden.id = row.id
    },
    handleUpdate: function () {
      let self = this
      self.$axios
        .post('/api/garden/updateGarden', self.garden)
        .then(function (res) {
          if (res.data.code) {
            self.$message({
              duration: 1500,
              message: '更新成功',
              type: 'success'
            })
            // self.$router.push('/home/activeManage')
            //   location.reload()
            self.dialogVisible = false
            self.gardenList()
          } else {
            self.$message({
              duration: 1500,
              message: '更新失败',
              type: 'error'
            })
          }
        })
    }
  }
}
</script>

<style>
.gardenup .el-dialog--small{
    width:27%;
    /* height:15%; */
}
.gardenup .el-dialog{
    height: 50px;
}
</style>
