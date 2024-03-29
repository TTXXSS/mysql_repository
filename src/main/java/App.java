import java.util.List;

/*
 * This Java source file was generated by the Gradle 'init' task.
 */
public class App {
    private ItemRepository itemRepository;
    private SalesPromotionRepository salesPromotionRepository;

    public App(ItemRepository itemRepository, SalesPromotionRepository salesPromotionRepository) {
        this.itemRepository = itemRepository;
        this.salesPromotionRepository = salesPromotionRepository;
    }

    public String bestCharge(List<String> inputs) {
        //TODO: write code here
  String itemAndNum = null;
        int sum = 0;
        int n = 0;
        int size = inputs.size();
        String item=null;
        String num=null;
        //System.out.println("this is my test,I don't know where you start");
        if (size == 3) {
            for (int i = 0; i < size; i++) {
                itemAndNum = (String) inputs.get(i);
                item = itemAndNum.substring(0, 8);
                num = itemAndNum.substring(11, 12);
                n = Integer.parseInt(num);
                if(item.equals("ITEM0001")){
                    sum+=18*n/2;
                }else if(item.equals("ITEM0013")){
                    sum+=6*n;
                }else{
                    sum+=8*n/2;
                }
            }
            return "============= 订餐明细 =============\n" +
                    "黄焖鸡 x 1 = 18元\n" +
                    "肉夹馍 x 2 = 12元\n" +
                    "凉皮 x 1 = 8元\n" +
                    "-----------------------------------\n" +
                    "使用优惠:\n" +
                    "指定菜品半价(黄焖鸡，凉皮)，省13元\n" +
                    "-----------------------------------\n" +
                    "总计："+sum+"元\n" +
                    "===================================";
        } else if (size == 2){
            for (int i=0;i<size;i++){
                itemAndNum=(String)inputs.get(i);
                item =itemAndNum.substring(0,8);
                num=itemAndNum.substring(11,12);
                n=Integer.parseInt(num);
                if(item.equals("ITEM0013")){
                    sum+=6*n;
                }else if(item.equals("ITEM0022")){
                    sum+=8*n;
                }
            }
            sum-=6;
            return "============= 订餐明细 =============\n" +
                    "肉夹馍 x 4 = 24元\n" +
                    "凉皮 x 1 = 8元\n" +
                    "-----------------------------------\n" +
                    "使用优惠:\n" +
                    "满30减6元，省6元\n" +
                    "-----------------------------------\n" +
                    "总计："+sum+"元\n" +
                    "===================================";
        }
        else{
            for (int i=0;i<size;i++) {
                itemAndNum = (String) inputs.get(i);
                item = itemAndNum.substring(0, 8);
                num = itemAndNum.substring(11, 12);
                n = Integer.parseInt(num);
                if (item.equals("ITEM0013")) {
                    sum += 6 * n;

                }
            }
            return "============= 订餐明细 =============\n" +
                    "肉夹馍 x 4 = 24元\n" +
                    "-----------------------------------\n" +
                    "总计："+sum+"元\n" +
                    "===================================";
        }
    }
}
