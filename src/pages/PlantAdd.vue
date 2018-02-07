<template>
  <el-form  :model="plantForm" ref="plantForm" label-width="100px" class="demo-dynamic">
  <el-form-item
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
  </el-form-item>
  <el-form-item
    label="名称:"
    prop="name"
  >
    <el-input v-model="plantForm.name"></el-input>
  </el-form-item>
  <el-form-item
    label= "产地:"
    prop="chandi"
  >
    <el-input v-model="plantForm.chandi"></el-input>
  </el-form-item>
  <el-form-item
    label= "目:"
    prop="mu"
  >
    <el-input v-model="plantForm.mu"></el-input>
  </el-form-item>
  <el-form-item
    label= "科:"
    prop="ke"
  >
    <el-input v-model="plantForm.ke"></el-input>
  </el-form-item>
   <el-form-item
    label= "属:"
    prop="shu"
  >
    <el-input v-model="plantForm.shu"></el-input>
  </el-form-item>
   <el-form-item
    label= "种:"
    prop="zhong"
  >
    <el-input v-model="plantForm.zhong"></el-input>
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
  v-model="plantForm.plantinfo">
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
  v-model="plantForm.xixing">
</el-input>
    <!-- <el-input v-model="plantForm.xixing"></el-input> -->
  </el-form-item>
  <!-- <el-upload
  class="avatar-uploader"
  action="/api/plant/uploadPlantImg"
  list-type="picture-card"
  :show-file-list="false"
  :on-success="handleAvatarSuccess"
  :before-upload="beforeAvatarUpload">
  <img v-if="plantForm.imgsrc" :src="plantForm.imgsrc" class="avatar">
    <i v-else class="el-icon-plus avatar-uploader-icon"></i>
</el-upload> -->

 <el-upload
    action="/api/plant/uploadPlantImg"
    list-type="picture-card"
    :on-remove="handleRemove"
    :on-success="handleAvatarSuccess"
    ref="upload"
    >
    <i class="el-icon-plus"></i>
    </el-upload>

  <el-form-item>
    <el-button type="primary" @click="submitForm('plantForm')">提交</el-button>
    <!-- <el-button @click="addDomain">新增域名</el-button> -->
    <el-button @click="resetForm('plantForm')">重置</el-button>
  </el-form-item>
</el-form>
</template>

<script>
export default {
  data () {
    return {
    //   imginfos: [
    //     {
    //       id: ,
    //       imgname:

    //     }
    //   ],
      gardens: [],
      file: {},
      fileList: [],
      plantForm: {
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
    submitForm (formName) {
      let self = this
      self.$axios
      .post('/api/plant/addPlantInfo', self.plantForm)
      .then(res => {
        if (res.data.code) {
          alert('提交成功')
        //   self.resetForm('plantForm')
          self.plantForm = {}
          self.$refs.upload.clearFiles()
        } else {
          alert('提交失败')
        }
      })
    },
    resetForm (formName) {
      let self = this
      self.$refs[formName].resetFields()
      self.$refs.upload.clearFiles()
    //   this.plantForm.imgname = ''
    },
    handleRemove (file, fileList) {
      let self = this
      self.$axios
      .get('/api/plant/deletePlantImg', {params: { fileName: file.name }})
      .then(function (res) {
        // console.log(res)
        if (res.data.code) {
          alert('删除成功')
        } else {
          alert('图片删除失败')
        }
      })
    },
    handleAvatarSuccess (res, file) {
      let self = this
      self.file = file
      self.fileList.push(file)
      if (res.code) {
        self.plantForm.imgname = res.data
        file.name = res.data
        console.log(file.name)
        if (!self.plantForm.imgsrc.length || self.plantForm.imgsrc == null) {
          self.plantForm.imgsrc = 'src/assets/' + self.plantForm.imgname
        } else {
          self.plantForm.imgsrc = 'src/assets/' + self.plantForm.imgname + ',' + self.plantForm.imgsrc
        }

        // console.log(self.plantForm.imgsrc)
      } else {
        alert('上传失败')
      }
      //   this.plantForm.imgsrc = URL.createObjectURL(file.raw)

      //   console.log(file)
    },
    beforeAvatarUpload (file) {
      const isJPG = file.type === 'image/jpeg'
      const isLt2M = file.size / 1024 / 1024 < 2

      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG 格式!')
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!')
      }
      return isJPG && isLt2M
    }
    // removeDomain (item) {
    //   var index = this.dynamicValidateForm.domains.indexOf(item)
    //   if (index !== -1) {
    //     this.dynamicValidateForm.domains.splice(index, 1)
    //   }
    // }
    // addDomain () {
    //   this.dynamicValidateForm.domains.push({
    //     value: '',
    //     key: Date.now()
    //   })
    //
  }
}
</script>
<style>
.demo-dynamic {
  width: 600px;
  float: left;
  margin-left: 100px;
}
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>
