using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rope : MonoBehaviour
{

    private LineRenderer lineRenderer;
    private List<RopeSegment> ropeSegments = new List<RopeSegment>();
    private float ropeSegLen = 0.05f;
    int prevSegmentLength;
    public int segmentLength;
    int maxLength = 0;
    private float lineWidth = 0.005f;

    GameObject RopeHangPoint;

    bool endSegLock = true;

    public Transform startPos;
    public Transform endPos;

    public Vector3 Direction = -Vector3.up;

    // Use this for initialization
    void Start()
    {
        this.lineRenderer = this.GetComponent<LineRenderer>();

        RopeHangPoint = GameObject.Find("RopeHangPoint");

        Vector3 ropeStartPoint = RopeHangPoint.transform.position;
        //Vector3 ropeStartPoint = Camera.main.ScreenToWorldPoint(Input.mousePosition);

        for (int i = 0; i < segmentLength; i++)
        {
            this.ropeSegments.Add(new RopeSegment(ropeStartPoint));
            ropeStartPoint.y -= ropeSegLen;
        }

        maxLength = segmentLength;
    }


    public float GetRopeSegLength()
    {
        return ropeSegLen;
    }
    public int GetMaxLength()
    {
        return maxLength;
    }

    public void ChangeEndSegLock()
    {
        endSegLock = !endSegLock;
    }

    // Update is called once per frame
    void Update()
    {        
        if (prevSegmentLength < segmentLength)
        {
            prevSegmentLength = segmentLength;
            this.Simulate();
        }

        if (endSegLock)
        {
            endPos.gameObject.transform.position = this.ropeSegments[this.segmentLength-1].posNow;
        }
        
        
        this.DrawRope();
    }

    private void FixedUpdate()
    {
        prevSegmentLength = segmentLength;
        this.Simulate();
    }

    private void Simulate()
    {
        // SIMULATION
        Vector3 forceGravity = Direction;

        for (int i = 1; i < this.segmentLength; i++)
        {
            RopeSegment firstSegment = this.ropeSegments[i];
            Vector3 velocity = firstSegment.posNow - firstSegment.posOld;
            firstSegment.posOld = firstSegment.posNow;
            firstSegment.posNow += velocity;
            firstSegment.posNow += forceGravity * Time.fixedDeltaTime;
            this.ropeSegments[i] = firstSegment;
        }

        //CONSTRAINTS
        for (int i = 0; i < 50; i++)
        {
            this.ApplyConstraint();
        }
    }

    private void ApplyConstraint()
    {
        /*
        //Constrant to Mouse
        RopeSegment firstSegment = this.ropeSegments[0];
        firstSegment.posNow = RopeHangPoint.transform.position;
        this.ropeSegments[0] = firstSegment;
        */

        RopeSegment firstSegment = this.ropeSegments[0];
        firstSegment.posNow = startPos.position;
        this.ropeSegments[0] = firstSegment;

        if (!endSegLock)
        {
            RopeSegment lastSegment = this.ropeSegments[segmentLength - 1];
            lastSegment.posNow = endPos.position;
            this.ropeSegments[segmentLength - 1] = lastSegment;
        }
        
        for (int i = 0; i < this.segmentLength - 1; i++)
        {
            RopeSegment firstSeg = this.ropeSegments[i];
            RopeSegment secondSeg = this.ropeSegments[i + 1];

            float dist = (firstSeg.posNow - secondSeg.posNow).magnitude;
            float error = Mathf.Abs(dist - this.ropeSegLen);
            Vector3 changeDir = Vector3.zero;

            if (dist > ropeSegLen)
            {
                changeDir = (firstSeg.posNow - secondSeg.posNow).normalized;
            } 
            else if (dist < ropeSegLen)
            {
                changeDir = (secondSeg.posNow - firstSeg.posNow).normalized;
            }

            Vector3 changeAmount = changeDir * error;

            if (i != 0)
            {
                firstSeg.posNow -= changeAmount * 0.5f;
                secondSeg.posNow += changeAmount * 0.5f;

                this.ropeSegments[i] = firstSeg;
                this.ropeSegments[i + 1] = secondSeg;
            }
            else
            {
                secondSeg.posNow += changeAmount;
                this.ropeSegments[i + 1] = secondSeg;
            }
        }
    }

    private void DrawRope()
    {
        float lineWidth = this.lineWidth;
        lineRenderer.startWidth = lineWidth;
        lineRenderer.endWidth = lineWidth;

        Vector3[] ropePositions = new Vector3[this.segmentLength];
        for (int i = 0; i < this.segmentLength; i++)
        {
            ropePositions[i] = this.ropeSegments[i].posNow;
        }

        lineRenderer.positionCount = ropePositions.Length;
        lineRenderer.SetPositions(ropePositions);
    }

    public struct RopeSegment
    {
        public Vector3 posNow;
        public Vector3 posOld;

        public RopeSegment(Vector3 pos)
        {
            this.posNow = pos;
            this.posOld = pos;
        }
    }
}