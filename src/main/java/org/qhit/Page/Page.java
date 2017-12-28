package org.qhit.Page;

public class Page {
    private Integer pageno;//当前页
    private Integer pagesize;//页面大小
    private Integer totalcount;//总条数
    private Integer totalpage;//总页数
    private Integer startrownum;//起始页
    private Integer endrownum;//结束页
    private Integer deptno;//部门编号
    
    public Integer getDeptno() {
        return deptno;
    }
    public void setDeptno(Integer deptno) {
        this.deptno = deptno;
    }
    public Integer getPageno() {
        return pageno;
    }
    public void setPageno(Integer pageno) {
        this.pageno = pageno;
    }
    public Integer getPagesize() {
        return pagesize;
    }
    public void setPagesize(Integer pagesize) {
        this.pagesize = pagesize;
    }
    public Integer getTotalcount() {
        return totalcount;
    }
    public void setTotalcount(Integer totalcount) {
        this.totalcount = totalcount;
    }
    public Integer getTotalpage() {
        return totalpage;
    }
    public void setTotalpage(Integer totalcount) {
        this.totalpage = totalcount%pagesize==0?totalcount/pagesize:totalcount/pagesize+1;;
    }
    public Integer getStartrownum() {
        return startrownum;
    }
    public void setStartrownum(Integer startrownum) {
        this.startrownum = startrownum;
    }
    public Integer getEndrownum() {
        return endrownum;
    }
    public void setEndrownum(Integer endrownum) {
        this.endrownum = endrownum;
    }
    public Page() {
    }
    /**
     * 传入分页的条件页
     * @param pageno
     * @param pagesize
     */
    
    public Page(Integer pageno, Integer pagesize,Integer totalcount) {
        this.pageno = pageno;
        this.pagesize = pagesize;
        this.totalcount = totalcount;
        setTotalpage(totalcount);
        this.startrownum = (pageno-1)*pagesize;
        this.endrownum = pageno*pagesize;
    }
    
    /**
     * 模糊查询分页
     * @param pageno
     * @param pagesize
     * @param totalcount
     * @param deptno
     */
    public Page(Integer pageno, Integer pagesize, Integer totalcount,
            Integer deptno) {
        this(pageno, pagesize, totalcount);
        this.deptno = deptno;
    }
    
    
    @Override
    public String toString() {
        return "Page [pageno=" + pageno + ", pagesize=" + pagesize
                + ", totalcount=" + totalcount + ", totalpage=" + totalpage
                + ", startrownum=" + startrownum + ", endrownum=" + endrownum
                + "]";
    }
    
    
    
    

}