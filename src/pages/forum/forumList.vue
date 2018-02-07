    <template>
      <div>
    <el-table
    class="usertable"
    :data="forumData"
    stripe: true
    style="width: 1100px ">
    <el-table-column
      prop="username"
      label="发帖人"
      width="220">
    </el-table-column>
    <el-table-column
      prop="pubtime"
      label="时间"
      width="229">
    </el-table-column>
    <el-table-column
      prop="foruminfo"
      label="内容"
      width="430">
    </el-table-column>
      <el-table-column
      prop="commentcnt"
      label="评论数"
      width="130">
    </el-table-column>
     <el-table-column
      label="操作"
      width="100">
      <template slot-scope="scope">
        <el-button @click="deleteForum(scope.row)" type="text" size="small">删除</el-button>
        <!-- <el-button type="text" size="small" @click="updateUser(scope.row)">编辑</el-button> -->
      </template>
    </el-table-column>
    </el-table>
    </div>
</template>

<script>
export default {
  data () {
    return {
      forumData: [],
      foruminfo: {
        id: '',
        username: '',
        foruminfo: '',
        pubtime: '',
        commentcnt: ''
      }
    }
  },
  mounted: function () {
    this.forumList()
  },
  methods: {
    forumList: function () {
      let self = this
      self.$axios.get('/api/forum/getForums').then(function (res) {
        if (res.data.code) {
          self.forumData = res.data.data
        }
      })
    },
    deleteForum: function (row) {
      let self = this
      var isdelete = confirm('确定删除动态 以及动态包含的评论？')
      if (isdelete) {
        self.$axios
        .get('/api/forum/deleteForum', {params: {id: row.id}})
        .then(res => {
          self.$message({
            duration: 1500,
            message: '删除成功~',
            type: 'success'
          })
          self.forumList()
        })
      }
    }
  }
}
</script>

