using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class spawner : MonoBehaviour
{
    public GameObject foodPizza;
    public GameObject foodCoffee;
    public GameObject foodDoughnut;
    public GameObject foodPopcorn;
    public bool popcornExists = false;
    public int direction;
    public GameObject personA;
    public GameObject personB;
    public float spawnTimer;
    float spawnCounter;

    void Start()
    {
        spawnCounter = Random.Range(5f, 30f);
    }

    void Update()
    {
        if (spawnCounter <= 0)
        {
            int personChooser = (int)Mathf.Floor(Random.Range(0, 1.9f));
            GameObject p;
            if (personChooser == 0)
            {
                p = Instantiate(personA, transform.position, Quaternion.identity);
            }
            else
            {
                p = Instantiate(personB, transform.position, Quaternion.identity);
            }

            personController pCtrl = p.GetComponent<personController>();
            pCtrl.direction = direction;
            
            int itemChooser = (int)Mathf.Floor(Random.Range(0, 4.9f));

            if (popcornExists)
            {
                itemChooser = 2;
            }

            switch(itemChooser)
            {
                case 0:
                    break;
                case 1:
                    pCtrl.HeldItem = Instantiate(foodPizza, p.transform.position, Quaternion.identity);
                    pCtrl.HeldItem.transform.localScale = new Vector3(0.25f, 0.25f, 0.25f);
                    pCtrl.HeldItem.GetComponent<FoodItem>().personOwner = p;
                    break;
                case 2:
                    pCtrl.HeldItem = Instantiate(foodCoffee, p.transform.position, Quaternion.identity);
                    pCtrl.HeldItem.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
                    pCtrl.HeldItem.transform.localScale = new Vector3(0.25f, 0.25f, 0.25f);
                    pCtrl.HeldItem.GetComponent<FoodItem>().personOwner = p;
                    break;
                case 3:
                    pCtrl.HeldItem = Instantiate(foodDoughnut, p.transform.position, Quaternion.identity);
                    pCtrl.HeldItem.transform.localScale = new Vector3(3f, 3f, 3f);
                    pCtrl.HeldItem.GetComponent<FoodItem>().personOwner = p;
                    break;
                case 4:
                    pCtrl.HeldItem = Instantiate(foodPopcorn, p.transform.position, Quaternion.identity);
                    pCtrl.HeldItem.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
                    pCtrl.HeldItem.GetComponent<FoodItem>().personOwner = p;
                    popcornExists = true;
                    break;
            }

            if (itemChooser > 0)
            {
                pCtrl.HeldItem.GetComponent<FoodItem>().spawner = this.gameObject;
            }
            

            spawnCounter = spawnTimer + Random.Range(5, 30);
        }
        else
        {
            spawnCounter -= 2f * Time.deltaTime;
        }
        
    }
}
