using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FoodItem : MonoBehaviour
{
    bool fedToMonster = false;
    public GameObject personOwner;
    public float nutritionalValue = 0f;
    GameObject monster;
    public AudioSource eatenSound;
    EaterController eCtrl;
    GameObject tar;
    float destroyCounter = 5f;

    public GameObject spawner;


    void Start()
    {
        monster = GameObject.Find("EATER");      
        eatenSound.Stop();
    }

    public void feedToMonster()
    {
        fedToMonster = true;
    
        eatenSound.Play();
    
        eCtrl = monster.GetComponent<EaterController>();  

        eCtrl.Feed(nutritionalValue);
    }

    void Update()
    {
        if (fedToMonster)
        {
            if (destroyCounter <= 0f)
            {
                if (nutritionalValue == 5)
                {
                    spawner.GetComponent<spawner>().popcornExists = false;
                }
                Destroy(this);
            }
            else
            {
                destroyCounter -= 3f * Time.deltaTime;
                transform.position -= transform.forward * 0.5f;
            }
        }    
    }
}
