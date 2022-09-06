[1mdiff --git a/app/javascript/controllers/map_meeting_point_controller.js b/app/javascript/controllers/map_meeting_point_controller.js[m
[1mindex 3e0a92a..bbe6d3f 100644[m
[1m--- a/app/javascript/controllers/map_meeting_point_controller.js[m
[1m+++ b/app/javascript/controllers/map_meeting_point_controller.js[m
[36m@@ -65,7 +65,7 @@[m [mexport default class extends Controller {[m
 [m
 [m
 [m
[31m-      // modif a faire pour faire AFFICHER LA partial map_card[m
[32m+[m[32m      // modif a faire pour faire AFFICHER LA partial map_card -> ou injecter code HTML dans formulaire[m
       this.mapboxTarget.insertAdjacentHTML('afterEnd', e.map_card)[m
     })[m
   }[m
