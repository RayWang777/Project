# Project
Final_Project
TeamProject About Drink Shop

#環境
ECLIPSE 2021-03
MAVEN apache-maven-3.8.5

#JS/CSS
JQUERY 3.6.0
SWEET ALERT2

#upload
1.git下拉檔案到本機
2.確認下載目錄中 \drinkmaster\ 下.gitignore 內容是空的 可以用nopad++開啟
3.eclipse 設定workspace JSP HTML CSS contentype 為UTF-8 
4.設定maven路徑
5.匯入剛剛下載的專案內容 匯入->maven ->exist maven project
6.測試再將內容傳回自己git

notice
1.後臺頁面mapping皆為/backend/ 以下
2.<jsp:include page="header.jsp">於頁面開頭
3<jsp:include page="footer.jsp">於頁面結尾
4.pagecontroller 為目前先預設定個頁面後台
5.各自功能可以直接寫在對應自己controller  記得後台的方法用/backend開頭

#.model放置為介面已預設基礎方法 可以不用更動
.service為已實作model的介面類別 新增需要額外功能直接寫在這邊
controller下方@autowired繪製入interface型別的service類別 
(舉例:  controller 寫 @Autowierd  UserService uService     然後再 UserServiceImp類別上方加註@Controller)


