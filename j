package cw2;

//imports needed
import java.util.*;
import java.lang.*;

public class Card implements Comparable<Card> {
    
//declaring the variables
    public Rank rank;
    public Suit suit;
    
    //Card constructor to set enums of card
    public Card(Rank rank, Suit suit) {
        
        this.rank = rank;
        this.suit = suit;
    }
    
    //Rank enum
    public enum Rank {
        
        //enum elements with values
        TWO(2), THREE(3), FOUR(4), FIVE(5), SIX(6), SEVEN(7), EIGHT(8), 
        NINE(9), TEN(10), JACK(10), QUEEN(10), KING(10), ACE(11);

        private final int value;
        
        //setting the value of the Rank enum
        Rank(int val) {
            
            value = val;
        }

        //accessor class to get value
        public int getValue() {
            
            return value;
        }
        
        //array to store the values in enum to be used in getNext() 
        private static final Rank[] val = values();
        
        
        public Rank getNext() {
            
            return val[(this.ordinal()+1) % val.length];
        }
    }

    //Suit enum
    public enum Suit {
        
        //enum elements
        CLUBS(1), DIAMONDS(2), HEARTS(3), SPADES(4);

        private final int value;

        //setting the value of the suit enum
        Suit(int val) {
            
            value = val;
        }
        
        //gets a random suit
        public static Suit getSuit() {
            
            Random rand = new Random();
            return values()[rand.nextInt(values().length)];
        }
    }
    
    //accessor method for rank
    public Rank getRank() {
        return this.rank;
    }

    //accessor method for suit
    public Suit getSuit() {
        return this.suit;
    } 
    
    //max method to get the highest value card in an arraylist given
    public static Card max(ArrayList<Card> arr) {
        
        //card with lowest value possible to be created to be compared
        Card card = new Card(Rank.TWO, Suit.CLUBS);
        
        //creating the iterator
	Iterator<Card> ite = arr.iterator();
	while (ite.hasNext()) {
            
            //uses compareTo to check if card is higher value than 'card'
            if((ite.next().compareTo(card)) == 1) {
                
                //if value is higher, it stores it in 'card'
                card = ite.next();
            }
        }
        //highest card is returned
        return card;
    }

    //Comparator 
    public static class CompareDescending implements Comparator<Card> {
        
        @Override
        public int compare(Card first, Card second) {
            
            if(first.getSuit().ordinal() == second.getSuit().ordinal()) {
                
                if(first.getSuit().ordinal() > second.getSuit().ordinal()) {
                    
                    return -1;
                }else if(first.getSuit().ordinal()<second.getSuit().ordinal()){
                    
                    return 1;
                }else {
                    
                    return 0;
                }
            }else if(first.getRank().ordinal() == second.getRank().ordinal()) {
                
                return 0;
            }else if(first.getRank().ordinal() > second.getRank().ordinal()) {
                
                return 1;
            }else {
                
                return -1;
            }
        }
    }
    
    public ArrayList chooseGreater (Card card, ArrayList<Card> arr) {
        ArrayList<Card> arr2 = new ArrayList();
        
        int x;
        for(x=0; x<arr2.size(); x++) {
            
            if(card.compareTo(arr.get(x)) == 1) {
                
                arr2.add(arr.get(x));
            }
        }
        
        return arr2;
    }
    
    @Override
    public String toString() {
        return this.rank + " " + this.suit;
    }
    
    @Override
    public int compareTo(Card card) {
        
        int result = this.getRank().compareTo(card.getRank());
        
        if (result == 0){
            
            result = this.getSuit().compareTo(card.getSuit());
        }
        
        return result;
    }
    
                 

    public static void main(String[] args)
    {
        Suit xtcy = Suit.getSuit();
        //System.out.println(xtcy);
        
        int x;
        
        for(x=0;x<10;x++)
        {
            Suit xtcz = Suit.getSuit();
            //System.out.println(xtcz);
        }
        
        Card noa = new Card(Rank.TWO, Suit.DIAMONDS);
        Card nob = new Card(Rank.TWO, Suit.SPADES);
        Card noc = new Card(Rank.ACE, Suit.HEARTS);
        Card nod = new Card(Rank.TWO, Suit.CLUBS);
        
        System.out.println(noa);
        
        ArrayList ctlist = new ArrayList<>();
        
        ctlist.add(noa);
        ctlist.add(nob);
        ctlist.add(noc);
        ctlist.add(nod);
        
        System.out.println(max(ctlist));
        
    
    };
        
    
    }
