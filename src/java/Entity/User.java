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
public class User {
    int user_id;
    String user_name;
    String user_email;
    String user_pass;
    String isAdmin;

    public User() {
    }

    public User(int user_id, String user_name, String user_email, String user_pass, String isAdmin) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_pass = user_pass;
        this.isAdmin = isAdmin;
    }
    
    public User(String user_name) {
        this.user_name = user_name;

    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_pass() {
        return user_pass;
    }

    public void setUser_pass(String user_pass) {
        this.user_pass = user_pass;
    }

    public String getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(String isAdmin) {
        this.isAdmin = isAdmin;
    }

  
    
    
}
