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
      prop="name"
      label="植物名称"
      width="339">
    </el-table-column>
    <el-table-column
      prop="plantinfo"
      label="植物简介"
      width="330">
    </el-table-column>
     <el-table-column
      label="操作"
      width="100">
      <template slot-scope="scope">
        <el-button @click="deletePlant(scope.row)" type="text" size="small">删除</el-button>
        <el-button type="text" @click="updatePlant(scope.row)" size="small">编辑</el-button>
      </template>
    </el-table-column>

  </el-table>
<div>
    <el-dialog
    title="编辑植物"
    :visible.sync="dialogVisible"
    width="30%"
    >
    <el-form  :model="plantinfo" ref="plantForm" label-width="100px" class="demo-dynamic">
  <!-- <el-form-item
    label="所属园林"
    prop="gardencode"
    >
    <el-select v-model="plantForm.gardencode" placeholder="请选择">
    <el-option
      v-for="garden in gardens"
      :key="garden.gardencode"
      :label="garden.gardenname"
      :value="garden.gardencode"
    >
    </el-option>
  </el-select>
  </el-form-item> -->
  <el-form-item
    label="名称:"
    prop="name"
  >
    <el-input v-model="plantinfo.name"></el-input>
  </el-form-item>
  <el-form-item
    label= "产地:"
    prop="chandi"
  >
    <el-input v-model="plantinfo.chandi"></el-input>
  </el-form-item>
  <el-form-item
    label= "目:"
    prop="mu"
  >
    <el-input v-model="plantinfo.mu"></el-input>
  </el-form-item>
  <el-form-item
    label= "科:"
    prop="ke"
  >
    <el-input v-model="plantinfo.ke"></el-input>
  </el-form-item>
   <el-form-item
    label= "属:"
    prop="shu"
  >
    <el-input v-model="plantinfo.shu"></el-input>
  </el-form-item>
   <el-form-item
    label= "种:"
    prop="zhong"
  >
    <el-input v-model="plantinfo.zhong"></el-input>
  </el-form-item>
  <el-form-item
    label= "简介:"
    prop="plantinfo"
  >
    <!-- <el-input v-model="plantForm.plantinfo"></el-input> -->
    <el-input
  type="textarea"
  :rows="2"
  placeholder="请输入介绍"
  v-model="plantinfo.plantinfo">
</el-input>

  </el-form-item>
  <el-form-item
    label= "习性:"
    prop="xixing"
  >
  <el-input
  type="textarea"
  :rows="2"
  placeholder="请输入习性"
  v-model="plantinfo.xixing">
</el-input>
  </el-form-item>


 <!-- <el-upload
    action="/api/plant/uploadPlantImg"
    list-type="picture-card"
    :on-remove="handleRemove"
    :on-success="handleAvatarSuccess"
    ref="upload"
    >
    <i class="el-icon-plus"></i>
    </el-upload> -->
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
      plantinfo: {
        id: '',
        name: '',
        chandi: '',
        gardencode: '',
        mu: '',
        ke: '',
        shu: '',
        zhong: '',
        plantinfo: '',
        xixing: '',
        imgname: '',
        imgsrc: ''
      }
    }
  },
  mounted: function () {
    this.plantList()
  },
  methods: {
    plantList: function () {
      let self = this
      self.$axios.get('/api/plant/getPlants').then(function (res) {
        if (res.data.code) {
          self.tableData = res.data.data
        }
      })
    },
    plantInfo: function (id) {
      let self = this
      self.$axios
      .get('/api/plant/getPlantInfo', { params: { id: id } })
      .then(res => {
        if (res.data.code) {
          self.plantinfo = res.data.data
        }
      }
      )
    },
    deletePlant: function (row) {
      let self = this
      var isdelete = confirm('确定删除？')
      if (isdelete) {
        self.$axios
          .get('/api/plant/deletePlant', { params: { id: row.id } })
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
        self.plantList()
      }
    },
    updatePlant: function (row) {
      let self = this
      //   var isdelete = confirm('确定删除？')
      self.dialogVisible = true
      self.plantInfo(row.id)
    },
    handleUpdate: function () {
      let self = this
      self.$axios
        .post('/api/plant/updatePlant', self.plantinfo)
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
            self.plantList()
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
/* .el-dialog--small{
    width:50%;
} */
</style>
