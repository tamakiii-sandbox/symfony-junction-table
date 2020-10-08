<?php
namespace App\Controller;

use App\Entity\User;
use App\Entity\UserGroup;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;

class IndexController
{
    public function index(EntityManagerInterface $em): Response
    {
        $user = $em->getRepository(User::class)->find(1);
        $group = $em->getRepository(UserGroup::class)->find(1);

        return new JsonResponse([
            [
                'is_array' => is_array($user->getGroup()),
                'count' => count($user->getGroup()),
            ],
            [
                'is_array' => is_array($user->getGroup()->getValues()),
                'count' => count($user->getGroup()->getValues()),
            ],
            [
                'is_array' => is_array($group->getUsers()),
                'count' => count($group->getUsers()),
            ],
            [
                'is_array' => is_array($group->getUsers()->getValues()),
                'count' => count($group->getUsers()->getValues()),
            ]
        ]);
    }
}
