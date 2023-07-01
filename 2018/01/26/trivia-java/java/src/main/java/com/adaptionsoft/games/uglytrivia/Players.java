package com.adaptionsoft.games.uglytrivia;

import java.util.ArrayList;
import java.util.List;

public class Players {


    private List<String> names;

    public Players() {
        this.names = new ArrayList<String>();
    }

    public void addPlayer(String name) {

        this.names.add(name);
    }

    public boolean contains(String name) {
        return names.contains(name);
    }

    public int count() {
        return names.size();
    }


    public String getPlayer(int i) {
        return names.get(i);
    }
}
