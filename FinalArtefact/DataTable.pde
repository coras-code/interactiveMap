class DataTable { //table is a reserved word
  Table table; 
  String [] city = {};
  float[] x = {};
  float[] y = {};
  int [][] population = {};
  
  float[] lon = {}; //*Alternate method*
  float[] lat = {}; //*Alternate method*
  
  //constructor 
  DataTable() {
      table = loadTable("data/data.csv", "header");
      population = new int[3][table.getRowCount()]; // load CSV data
    }
    
    void extractData() {
         for (int i = 0; i < table.getRowCount(); i++) {
         TableRow row = table.getRow(i);
       
         city = append(city, row.getString("City"));
         x = append(x, row.getInt("x")); // populate x coordinates
         y = append(y, row.getInt("y"));
         population[0][i] = removeQuotes(row.getString("1991"));
         population[1][i] = removeQuotes(row.getString("2001"));
         population[2][i] = removeQuotes(row.getString("2011"));
         
         //*alternate method for convert latitude and longitude to coordinates* //didnt use
           //lat = append(lat, latConversion(row.getFloat("Latitude"), row.getFloat("Longitude"))); // didnt work
           //lon = append(lon, lonConversion(row.getFloat("Latitude"), row.getFloat("Longitude"))); // didnt work
           //x = append(x, map(lat[i], min(lat), max(lat), 255, 550)); // populate x coordinates
           //y = append(y, map(lon[i], min(lon), max(lon), 180, 672));
        } 
  }
    
    void sketch() {
      
      float maxPopulation = max(population[year]);
      int maxP = 1000;
      
        for (int i=0; i<city.length-1; i++) {
        float p =  map(population[year][i], 0, maxPopulation, 0, maxPopulation/maxP); //int  p = map(populationYear, ;
            push();
            noStroke();
            smooth();
            scale(0.25);
            textSize(16);
            textAlign(LEFT);
            
          //filter
            if (low && p > 0 && p <= maxP/5) {
                fill(colour[1]);
                translate(x[i], y[i], p/4); // p/4 ro move up from below map
                box(5, 5, p/2); //p/2 to reduce size on map
                fill(0); //text colour 
           
                if (details) {presentDetails(p, population[year][i], city[i]);}
                
            } else if (mid && p > maxP/5 && p <= maxP/2) {
                fill(colour[0]);
                translate(x[i], y[i], p/4);
                box(5, 5, p/2); 
                
                if (details) {presentDetails(p, population[year][i], city[i]);}
                
            } else if (high && p > maxP/2) {
                fill(colour[2]);
                translate(x[i], y[i], p/4); 
                box(5, 5, p/2);   
                
                if (details) {presentDetails(p, population[year][i], city[i]);}
            }
            pop(); 
      }
    }
    //present city name and population number 
    void presentDetails(float p, int population, String city) {
                push();
                translate(-15, 0, -p/4);
                rotateX(-PI/2);
                rotateZ(-PI/2);
                fill(0);
                text(city, 0, 0);
                textSize(12);
                translate(0, 10, 0);
                text(population, 0, 0);
                pop();
    }
    
    
  }//end of class
         
         //refractoring to remove repeated steps
         int removeQuotes(String stringToBeConverted) {
         String populationString = stringToBeConverted;
         String[] split = split(populationString, ',');
         int population = int(join(split, ""));
         return population;
        }
        
        //*alternate method for converting lat and lon to map coordinates* //didnt use
        float latConversion(float lat, float lon) {
          float r = 1;
          float theta = radians(lat);
          float phi = radians(lon) + PI;
          float x = r * cos(theta) * cos(phi);
          return x;
        }
        
          float lonConversion(float lat, float lon) {
          float r = 1;
          float theta = radians(lat);
          float phi = radians(lon) + PI;
          float y = -r * sin(theta);
          return y;
        }
