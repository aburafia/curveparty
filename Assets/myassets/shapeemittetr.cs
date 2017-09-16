using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class shapeemittetr : MonoBehaviour {

    public GameObject quardPrefab;

    public List<Texture2D> shapemask;

    public List<Texture2D> black;
    public List<Texture2D> gradation;
    public List<Texture2D> pattern;
    public List<Texture2D> glitch;
    public List<Texture2D> surface;

    void Start()
    {
        StartCoroutine(letsgo());

    }

	// Use this for initialization
	IEnumerator letsgo () {
		

        for(int i =0; i<50; i++)
        {
            yield return 0;

            GameObject g = Instantiate(quardPrefab);
            var shaperobj = g.GetComponent<shaper>();
        
            var random = new RandomBoxMuller();

            g.transform.position = new Vector3((float)random.next() * 5f, (float)random.next() * 5f, 0.0f);
            float scaleset = Mathf.Abs((float)random.next()) * 5f + 1f;
            g.transform.localScale = new Vector3(scaleset, scaleset, 0.0f);
            g.transform.rotation = Quaternion.Euler((float)random.next() * 90f, 0.0f, (float)random.next() * 360f);

            //fill
            List<float> plist = new List<float>() { 0.6f, 0.2f, 0.1f, 0.1f };
            List< List<Texture2D>> filllist = new List<List<Texture2D>> (){
                gradation ,pattern ,glitch , surface 
            };
            
            float p = Mathf.Abs((float) random.next());



            float countup = 0f;

            countup = 0f;
            for(int j = 0; j < filllist.Count; j++) 
            {

                countup += plist[j];
                if(p < countup)
                {

                    if (j != 1 && UnityEngine.Random.Range(0f,1f) > 0.5) { 
                        shaperobj.scalevalue = 1f;
                    }
                    else{
                        shaperobj.scalevalue = shaperobj.transform.localScale.x;
                    }

                    shaperobj.fill = filllist[j][UnityEngine.Random.Range(0, filllist[j].Count)];
                    break;
                }

            }

            //line
            List<List<Texture2D>> linelist = new List<List<Texture2D>>()
            {
                gradation,pattern,glitch,surface,black
            };

            List<Texture2D> selected = linelist[UnityEngine.Random.Range(0, linelist.Count)];

            shaperobj.line = selected[UnityEngine.Random.Range(0, selected.Count)];

            //sape
            shaperobj.mask = shapemask[UnityEngine.Random.Range(0, shapemask.Count)];

            shaperobj.init();
        }


    }
	
	// Update is called once per frame
	void Update () {
		
	}

    public class RandomBoxMuller
    {
        private System.Random random;

        public RandomBoxMuller()
        {
            random = new System.Random(Environment.TickCount);
        }

        public RandomBoxMuller(int seed)
        {
            random = new System.Random(seed);
        }

        public double next(double mu = 0.0, double sigma = 1.0, bool getCos = true)
        {
            if (getCos)
            {
                double rand = 0.0;
                while ((rand = random.NextDouble()) == 0.0) ;
                double rand2 = random.NextDouble();
                double normrand = Math.Sqrt(-2.0 * Math.Log(rand)) * Math.Cos(2.0 * Math.PI * rand2);
                normrand = normrand * sigma + mu;
                return normrand;
            }
            else
            {
                double rand;
                while ((rand = random.NextDouble()) == 0.0) ;
                double rand2 = random.NextDouble();
                double normrand = Math.Sqrt(-2.0 * Math.Log(rand)) * Math.Sin(2.0 * Math.PI * rand2);
                normrand = normrand * sigma + mu;
                return normrand;
            }
        }

        public double[] nextPair(double mu = 0.0, double sigma = 1.0)
        {
            double[] normrand = new double[2];
            double rand = 0.0;
            while ((rand = random.NextDouble()) == 0.0) ;
            double rand2 = random.NextDouble();
            normrand[0] = Math.Sqrt(-2.0 * Math.Log(rand)) * Math.Cos(2.0 * Math.PI * rand2);
            normrand[0] = normrand[0] * sigma + mu;
            normrand[1] = Math.Sqrt(-2.0 * Math.Log(rand)) * Math.Sin(2.0 * Math.PI * rand2);
            normrand[1] = normrand[1] * sigma + mu;
            return normrand;
        }
    }
}