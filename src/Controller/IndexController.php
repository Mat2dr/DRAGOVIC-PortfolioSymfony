<?php
 namespace App\Controller;

 use App\Repository\CVRepository;
 use App\Repository\PostRepository;
 use App\Repository\SituationRepository;
 use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
 use Symfony\Component\HttpFoundation\Request;
 use Symfony\Component\HttpFoundation\Response;
 use Symfony\Component\Routing\Annotation\Route;

 class IndexController extends AbstractController
{
     /**
      * @param Request $req
      * @param PostRepository $repo
      * @param SituationRepository $situation
      * @param CVRepository $cv
      * @return \Symfony\Component\HttpFoundation\Response
      * @Route("/", name="index")
      */
    public function index(Request $req, PostRepository $repo, SituationRepository $situation, CVRepository $cvrepo ) : Response
    {
        $cv = $cvrepo->findAll();
        $situation = $situation->findAll();
        $posts = $repo->findAll();
        return $this->render('index.html.twig', ['projets' => $posts, 'situations' => $situation, 'cv' => $cv]);
    }

}

