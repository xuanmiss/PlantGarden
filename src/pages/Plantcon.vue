
<template>
      <div id="planthome">
        <!-- 头部导航 -->
        <!-- <div style="position: relative;height: 60px;width: 100%;"></div> -->
        <mheader></mheader>
        <main>
            <div class="plforum">
                <el-input class="plforuminfo" type="textarea" :rows="2" placeholder="请输入内容" v-model="tieziInfo.foruminfo">
                </el-input>
                <el-button class="plforumbtn" type="info" size="large" @click="submitFom" round>发布</el-button>
                <div class="plforumpho">
                <el-upload
                action="/api/plant/uploadPlantImg"
                list-type="picture-card"
                ref="uploadf"
                :on-success="handlePictureSucc"
                :on-preview="handlePictureCardPreview"
                :on-remove="handleRemove">
                <i class="el-icon-plus"></i>
                </el-upload>
                <el-dialog :visible.sync="dialogVisibl" size="tiny">
                <img width="100%" :src="dialogImageUrl" alt="">
                </el-dialog>
                </div>
            </div>
            <div v-for="data in forums" :key="data.forum.forum.id">
            <div  class="plcomment">

                <div class="pltiezi">
                    <div class="allplinfo">
                    <div class="pluser">
                    <Avatar style="background-color: #87d068;" icon="person" />
                    <el-tag type="info"  size="medium" >用户：{{data.forum.forum.username}}</el-tag>
                    <br/>
                    <el-tag type="info">时间：{{data.forum.forum.pubtime}}</el-tag>
                    </div>
                    <div class="pforuminfo">
                     <p style="font-size:16px;">{{data.forum.forum.foruminfo}}</p>
                    </div>
                    </div>
                    <div class="plimg" v-for="img in data.imgs" :key="img.id"><img class="plimg" :src="img.irc"/></div>
                    <div class="plfunc">
                        <el-dialog
                        title="发表评论"
                        :visible.sync="dialogVisible"
                        width="30%"
                        :before-close="handleClose">
                        <el-input class="plcomnew" type="textarea" :rows="2" placeholder="请输入内容" v-model="forumcom.commentinfo">
                        </el-input>
                        <span slot="footer" class="dialog-footer">
                            <el-button @click="cancelComment">取 消</el-button>
                            <el-button type="primary" @click="pubComment">发表</el-button>
                        </span>

                        </el-dialog>
                         <div class="combtn">
                        <el-badge :value="data.forum.forum.commentcnt" class="item">
                        <el-button size="large" type="info" style="margin-left:50px;"  @click="pubCom(data.forum)">评论</el-button>
                        </el-badge>
                        <el-badge :value="data.forum.forum.commentcnt" class="item">
                        <el-button size="large" type="warning" style="margin-left:100px">回复</el-button>
                        </el-badge>
                         </div>
                    </div>

                </div>
            <div class="plcoms">
                <el-collapse v-for="comment in data.forum.comments" :key="comment.id" v-model="activeName" accordion>
                <el-collapse-item :title="comment.username+' 在 '+comment.comtime+' 评论：'+comment.commentinfo.substring(0,10)" :name="comment.id">
                    <!-- <div>与现实生活一致：与现实生活的流程、逻辑保持一致，遵循用户习惯的语言和概念；</div>
                    <div>在界面中一致：所有的元素和结构需保持一致，比如：设计样式、图标和文本、元素的位置等。</div> -->
                    <div>{{comment.commentinfo}}</div>
                </el-collapse-item>
                </el-collapse>
            </div>

            </div>
            </div>

        </main>
      </div>
</template>
<script>
import mheader from '../components/Header.vue'
// import hub from '../../components/hub.vue'
export default {
  components: {
    mheader
  },
  data () {
    return {
      textarea: '这是个帖子',
      activeName: '1',
      ftmp: {},
      username: 'adminadmin',
      dialogImageUrl: '',
      dialogVisibl: false,
      dialogVisible: false,
    //   imgs: [
    //     '/src/assets/rose.jpg',
    //     '/src/assets/logo.png',
    //     '/src/assets/rose.jpg',
    //     '/src/assets/logo.png'
    //   ],
      commen: [],
      // 表单的提交
      file: {},
      fileList: [],
      tieziInfo: {
        foruminfo: '',
        userid: '',
        username: '',
        imgsrcs: '',
        imgname: ''
      },
      forumcom: {
        id: '',
        commentinfo: '',
        forumid: '',
        userid: '',
        username: ''
      },
      forumn: {
        forum: {
          id: '',
          foruminfo: '',
          commentcnt: '',
          imgsrcs: '',
          userid: '',
          username: '',
          pubtime: ''
        },
        imgs: []
      },
      // end
      forums: []

    }
  },
  mounted: function () {
    // location.reload()
    let self = this
    self.getAllForums()
  },
  methods: {
    getAllForums: function () {
      let self = this
      self.$axios
        .get('/api/forums/getForums')
        .then(res => {
          if (res.data.code) {
            self.forums = []
            // self.imgs = []
            // self.forums = res.data.data
            for (let i = 0; i < res.data.data.length; i++) {
              self.forumn.imgs = []
            //   forumset = {}
              self.forumn.forum = {}
              self.forumn.forum = res.data.data[i]

              var strimg = res.data.data[i].forum.imgsrcs
              var ircs = strimg.split(',')
              for (let i = 0; i < ircs.length; i++) {
                self.forumn.imgs.push({id: i + 1, irc: ircs[i]})
              }
            //   console.log(self.forumn.forum)
              this.forums.push({forum: self.forumn.forum, imgs: self.forumn.imgs})
            //   self.forums.push({forum: self.forum, comments: self.comments})
            }
            console.log(this.forums)
            // console.log(self.imgs)

            // console.log(self.forums)
          }
        })
    },
    submitFom: function () {
      let self = this
      console.log(self.tieziInfo)
      self.tieziInfo.userid = sessionStorage.getItem('userid')
      self.tieziInfo.username = sessionStorage.getItem('username')
      if (sessionStorage.getItem('isLogin')) {
        self.$axios
        .post('/api/forum/addForum', self.tieziInfo)
        .then(res => {
          if (res.data.code) {
            self.$message({
              duration: 1500,
              message: '恭喜你，发布帖子成功',
              type: 'success'
            })

            self.getAllForums()
            self.tieziInfo = {}
            self.$refs.uploadf.clearFiles()
          } else {
            self.$message({
              duration: 1500,
              message: '发帖失败',
              type: 'error'
            })
          }
        })
      } else {
        self.$message({
          duration: 1500,
          message: '登录过期，请重新登录',
          type: 'error'
        })
        self.$router.push('/login')
      }
    },
    pubCom: function (tmp) {
      let self = this
      self.ftmp = tmp
      self.dialogVisible = true
      console.log(self.ftmp)
    },
    pubComment: function () {
      let self = this
      console.log(self.ftmp)
    //   console.log(self.tieziInfo)
      self.forumcom.userid = sessionStorage.getItem('userid')
      self.forumcom.username = sessionStorage.getItem('username')
      self.forumcom.forumid = self.ftmp.forum.id
    //   console.log(id)
      if (sessionStorage.getItem('isLogin')) {
        self.$axios
        .post('/api/comment/addComment', self.forumcom)
        .then(res => {
          if (res.data.code) {
            self.$message({
              duration: 1500,
              message: 'lalala，评论成功',
              type: 'success'
            })

            self.flushComment()
            // forumset.comments = self.commen
            // self.getAllForums()
            self.updatacomcnt()
            self.forumcom = {}
            self.dialogVisible = false

            // self.$refs.uploadf.clearFiles()
          } else {
            self.$message({
              duration: 1500,
              message: '评论失败',
              type: 'error'
            })
          }
        })
      } else {
        self.$message({
          duration: 1500,
          message: '登录过期，请重新登录',
          type: 'error'
        })
        self.$router.push('/login')
      }
    },
    updatacomcnt: function () {
      let self = this
      console.log(self.ftmp.comments.length)
        // let n = self.ftmp.components
      self.$axios
      .get('/api/forum/updateForum', { params: { count: self.ftmp.comments.length + 1, id: self.ftmp.forum.id } })
      .then(res => {
        if (res.data.code) {
          self.ftmp.forum.commentcnt = res.data.data
        }
      })
    },
    cancelComment: function () {
      let self = this
      self.dialogVisible = false
    },
    flushComment: function () {
      let self = this

      self.$axios
      .get('/api/comment/getCommentById', { params: { id: self.ftmp.forum.id } })
      .then(res => {
        if (res.data.code) {
          self.ftmp.comments = res.data.data
        }
      })
    },
    handlePictureSucc (res, file, fileList) {
      let self = this
      self.file = file
      self.fileList.push(file)
      if (res.code) {
        self.tieziInfo.imgname = res.data
        file.name = res.data
        console.log(file.name)
        if (!self.tieziInfo.imgsrcs.length || self.tieziInfo.imgsrcs == null) {
          self.tieziInfo.imgsrcs = 'src/assets/' + self.tieziInfo.imgname
        } else {
          self.tieziInfo.imgsrcs = 'src/assets/' + self.tieziInfo.imgname + ',' + self.tieziInfo.imgsrcs
        }

        console.log(self.tieziInfo.imgsrcs)
      } else {
        alert('上传失败')
      }

      self.dialogImageUrl = res.data
      console.log(self.dialogImageUrl)
    },
    handleRemove (file, fileList) {
      console.log(fileList)
      let self = this
      self.$axios
      .get('/api/plant/deletePlantImg', {params: { fileName: file.response.data }})
      .then(function (res) {
        // console.log(res)
        if (res.data.code) {
          self.dialogImageUrl = ''
        } else {
          alert('图片删除失败')
        }
      })
    //   console.log(file, fileList)
    },
    handlePictureCardPreview (file) {
      this.dialogImageUrl = 'src/assets/' + file.response.data
      console.log(this.dialogImageUrl)
      this.dialogVisibl = true
    },
    handleClose (done) {
      this.$confirm('放弃编辑？')
          .then(_ => {
            done()
          })
          .catch(_ => {})
    }
  }
}
</script>

<style>
main {
  /* display: -webkit-box;
  display: -ms-flexbox;
   display: flex; */
  min-height: 800px;
  border: solid 1px #3091f2;
  /* background-color: #fcfcfc; */
}
.plforum {
    margin-left: 150px;
  height: 380px;
  width: 1200px;
}
.plcomment {
  width: 1200px;
  min-height: 220px;
  margin-left: 155px;
  border: solid 1px #cdcecf;
}
.el-collapse-item__content{
    background: #c3d3d2;
}
.plcoms{
    width:1130px;
    margin-left:35px;
}
.allplinfo{
    height:110px;
}
.pltiezi{
    border: solid 1px #bdcfe0;
    margin-top:5px;
    margin-left:25px;
    width:1150px;
    height: 230px;
    background: #d7dfdd;
}
.pltiezi:hover{
    transition: all 1.5s;
    background: #b1c1cf;
}
.plcoms{
    /* height: 150px; */
    border: solid 1px #bdcfe0;
}
.el-collapse-item__header{
    text-align: left !important;
    background: #cfe6e4;
}
.plfunc{
    margin-top: 30px;
}
.combtn{
    margin-top:20px;
    margin-right: 50px;
    float: right;
}
.pforuminfo{
    float: right;
    width: 900px;
  margin-top: 10px;
    margin-right: 20px;
    /* width:1000px; */
}


.pluser{
    float: left;
    margin-top: 10px;
    margin-left: 5px;
}
.plimg{
    margin-top:20px;
    margin-left:10px;
    float:left;
    width:100px;
    height: 70px;;
}
.plforumpho {
    margin-right:200px;
  margin-top: 15px;
}
.plforuminfo {
  width: 800px;
  margin-top: 30px;
  /* margin-left: 290px; */
  /* float: left; */
}
.el-textarea__inner {
  height: 100px;
}
.plforumbtn {
  margin-bottom: 20px;
  width: 80px;
  margin-left: 30px;
  height: 50px;
}
main{
     background-image:url("/src/assets/back3.jpg");
    /* background-repeat:no-repeat; */
    background-size: 100%;
    /* background-position-y: 40%; */
}
#app {
  min-width: 1200px;
  margin: 0 auto;
  /* font-family: "Helvetica Neue", "PingFang SC", Arial, sans-serif; */
}
</style>


