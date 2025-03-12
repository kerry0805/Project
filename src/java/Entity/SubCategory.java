/*       __  __     ______     ______     ______     __  __                    
        /\ \/ /    /\  ___\   /\  == \   /\  == \   /\ \_\ \                   
        \ \  _"-.  \ \  __\   \ \  __<   \ \  __<   \ \____ \                  
         \ \_\ \_\  \ \_____\  \ \_\ \_\  \ \_\ \_\  \/\_____\                 
          \/_/\/_/   \/_____/   \/_/ /_/   \/_/ /_/   \/_____/                 
                                                                             
   ______   ______     ______     ______     ______     ______     __    __    
  /\  == \ /\  == \   /\  __ \   /\  ___\   /\  == \   /\  __ \   /\ "-./  \   
  \ \  _-/ \ \  __<   \ \ \/\ \  \ \ \__ \  \ \  __<   \ \  __ \  \ \ \-./\ \  
   \ \_\    \ \_\ \_\  \ \_____\  \ \_____\  \ \_\ \_\  \ \_\ \_\  \ \_\ \ \_\ 
    \/_/     \/_/ /_/   \/_____/   \/_____/   \/_/ /_/   \/_/\/_/   \/_/  \/_/                                                                              
*/

package Entity;

/**
 *
 * @author kerry
 */
import java.util.ArrayList;

public class SubCategory extends Category {
    private int subCategory_id;
    private String subCategory_name;

    public SubCategory() {
        super();
    }

    public SubCategory(int category_id, String category_name, int subCategory_id, String subCategory_name) {
        super(category_id, category_name);
        this.subCategory_id = subCategory_id;
        this.subCategory_name = subCategory_name;
    }
    
    public SubCategory(int subCategory_id, String subCategory_name) {
        this.subCategory_id = subCategory_id;
        this.subCategory_name = subCategory_name;
    }
    
    public int getSubCategory_id() {
        return subCategory_id;
    }

    public void setSubCategory_id(int subCategory_id) {
        this.subCategory_id = subCategory_id;
    }

    public String getSubCategory_name() {
        return subCategory_name;
    }

    public void setSubCategory_name(String subCategory_name) {
        this.subCategory_name = subCategory_name;
    }
    
    @Override
    public String toString() {
        return "SubCategory{" + "subCategory_id=" + subCategory_id + ", subCategory_name=" + subCategory_name + ", category_name=" + getCategory_name() + '}';
    }
}

