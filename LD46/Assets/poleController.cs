using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class poleController : MonoBehaviour
{
    enum POLESTATES {
        NONE,
        WINDUP,
        THROW,
        FLOORED,
        PULL
    }
    POLESTATES state;
    public AudioSource castOutSound0;
    bool soundPlayed = false;
    float rotx = 0;
    float baseRotx = 0;
    float currVelocity = 1f;
    Rope line;

    GameObject bob;
    hookToObject bobHooker;
    float bobClampY = 0.75f;
    float bobClampZ = 0.5f;
    float reelCounter = 0f;
    float reelTimer = 0f;

    float momentum = 0f;
    float maxMomentum = 0f;

    public int items = 0;

    GameObject hookedObject;
    playerController player;
    Camera cam;

    Transform bobReelPoint;

    void Start()
    {
        state = POLESTATES.NONE;
        rotx = transform.localEulerAngles.x;
        baseRotx = rotx;

        line = FindObjectOfType<Rope>();
        player = FindObjectOfType<playerController>();
        cam = FindObjectOfType<Camera>();
        bob = GameObject.Find("Sphere");
        bobHooker = bob.GetComponent<hookToObject>();
        bobReelPoint = GameObject.Find("RopeHangPoint").transform;

        castOutSound0.Stop();

    }

    public void RotateForwards()
    {
        rotx += 250f * Time.deltaTime;
        
        transform.localRotation = Quaternion.Euler(rotx, 0f, 0f); 
    }

    public void RotateBackwards()
    {
        rotx -= 100f * Time.deltaTime;
        transform.localRotation = Quaternion.Euler(rotx, 0f, 0f); 
    }

    private void ClampHook()
    {
        float clampedBobX = bob.transform.position.x;
        float clampedBobY = Mathf.Clamp(bob.transform.position.y, transform.position.y - bobClampY, transform.position.y + bobClampY);
        float clampedBobZ = Mathf.Clamp(bob.transform.position.z, transform.position.z - bobClampZ, transform.position.z + bobClampZ);
        

        bob.transform.position = new Vector3(clampedBobX, clampedBobY, clampedBobZ);    
    }

    void Update()
    {
        if (player.paused)
        {
            return;
        }

        if (hookedObject)
        {
            hookedObject.transform.position = bob.transform.position;
        }

        switch(state)
        {
            case POLESTATES.NONE:
                line.segmentLength = 1;
                momentum = 0f;
                if (Input.GetMouseButtonDown(0))
                {
                    state = POLESTATES.WINDUP;
                    
                    //reset windup clamp vals
                    bobClampY = 0.75f;
                    bobClampZ = 0.5f;
                }
                break;
            
            case POLESTATES.WINDUP:
                if (Input.GetMouseButtonUp(0))
                {
                    //line.Direction = -cam.transform.forward;
                    castOutSound0.Play();
                    
                    state = POLESTATES.THROW;
                }

                //bob.GetComponent<Rigidbody>().velocity = transform.up + transform.forward * currVelocity;

                if (rotx>-120f)
                {
                    momentum += 5f * Time.deltaTime;
                }
                            
                RotateBackwards();
                rotx = Mathf.Max(rotx, -120f);
                break;

            case POLESTATES.THROW:

                if (rotx <= 60f)
                {
                    //line.Direction = transform.up;                   

                    RotateForwards();

                    if (!bobHooker.canHook && rotx >= -5f)
                    {
                        
                        line.ChangeEndSegLock();
                        bobHooker.canHook = true;
                        bob.GetComponent<Rigidbody>().velocity = momentum * transform.forward + Vector3.up * 0.1f;
                        maxMomentum = momentum;
                    }
                    
                    
                }
                else
                {
                    //line.Direction = Vector3.Lerp(line.Direction, cam.transform.forward + (Vector3.down * 0.1f), 0.25f);
                    momentum = Mathf.Max(-1, momentum - 1f * Time.deltaTime);
                   
                    bob.GetComponent<Rigidbody>().velocity += Vector3.down * 0.05f;

                    if (bobHooker.canHook)
                    {
                        
                        if (bobHooker.floored || bobHooker.hookedObject != null)
                        {
                            //castOutSound0.Stop();
                            //line.Direction = -Vector3.up;
                            state = POLESTATES.FLOORED;
                            //line.ChangeEndSegLock();
                            bob.GetComponent<Rigidbody>().velocity = Vector3.zero;
                            //bob.GetComponent<Rigidbody>().isKinematic = true;
                            bobHooker.floored = false;
                            return;
                        }
                    }
                }

                if (Vector3.Distance(bobReelPoint.position, bob.transform.position) > line.GetRopeSegLength() * (line.segmentLength))
                {
                    line.segmentLength = Mathf.Min(line.GetMaxLength(), line.segmentLength + 1);
                }

                break;

            case POLESTATES.FLOORED:

                bob.GetComponent<Rigidbody>().velocity = Vector3.zero;

                if (Input.GetKeyDown(KeyCode.Space))
                {
                    //line.ChangeEndSegLock();
                    reelCounter = line.segmentLength;
                    state = POLESTATES.PULL;
                }
                break;

            case POLESTATES.PULL:

                if (Input.GetKey(KeyCode.Space))
                {

                    if ((Vector3.Distance(bobReelPoint.position, bob.transform.position) <= 0.5f || !bobHooker.canHook))
                    {
                        reelCounter -= 15f * Time.deltaTime;
                        if (bobHooker.canHook)
                        {
                            bobHooker.canHook = false;
                            line.ChangeEndSegLock();
                        }                        
                        
                    }
                    else
                    {
                        Vector3 directionTowardsPlayer = bob.transform.position - transform.position;
                        bob.transform.position -= directionTowardsPlayer * 0.05f;
                    }

                    if (reelCounter < line.GetRopeSegLength() * line.segmentLength)
                    {
                        line.segmentLength = Mathf.Max(1, line.segmentLength - 1);
                        
                    }
                    else
                    {
                        reelCounter -= 100f * Time.deltaTime;
                    }
                }
                else
                {
                    if (line.segmentLength <= 1)
                    {
                        hookToObject h = bob.GetComponent<hookToObject>();
                        if (h.hookedObject != null)
                        {
                            items += 1;
                            player.AcquireItem(h.hookedObject);
                            h.hookedObject = null;
                        }
                        bob.transform.position = bobReelPoint.position;
                        bob.GetComponent<Rigidbody>().velocity = Vector3.zero;
                        state = POLESTATES.NONE;
                    }
                }

                break;
        }

        
    }
}
