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
public class Memory {
    String product_id;
    String memory;

    public Memory() {
    }

    public Memory(String product_id, String memory) {
        this.product_id = product_id;
        this.memory = memory;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getSize() {
        return memory;
    }

    public void setMemory(String memory) {
        this.memory = memory;
    }
    
}

