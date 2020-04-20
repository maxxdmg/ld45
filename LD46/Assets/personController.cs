using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class personController : MonoBehaviour
{
    public int direction = 0;
    int speed = 1;
    public GameObject HeldItem;
    GameObject player;
    playerController playerController;

    void Start()
    {
        player = GameObject.Find("Player");
        playerController = player.GetComponent<playerController>();
        transform.forward = Vector3.right;
    }

    
    void Update()
    {
        if (playerController.paused)
        {
            return;
        }

        if (Physics.Raycast(transform.position, transform.forward, out RaycastHit hit, 1f))
        {
            if (hit.transform.tag == "Despawner")
            {
                if (HeldItem != null)
                {
                    Destroy(HeldItem);
                }
                Destroy(this.gameObject);
            }
        }        

        transform.position += transform.forward * direction * speed * Time.deltaTime;
    
        if (HeldItem != null)
        {
            if (direction == 0)
            {
                HeldItem.transform.position = transform.position + transform.right * 1;
            }
            else
            {
                HeldItem.transform.position = transform.position + transform.right * direction;
            }
            
        }
    }
}
