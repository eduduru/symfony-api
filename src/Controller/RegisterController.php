<?php

/**
 * Constructor method.
 *
 * Initializes the object.
 */

namespace App\Controller;

use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;


class RegisterController extends AbstractController
{
    private $entityManager;
    private $passwordEncoder;
    private $validator;

    /**
 * Constructor method.
 *
 * Initializes the object.
 */

    public function __construct(EntityManagerInterface $entityManager, UserPasswordEncoderInterface $passwordEncoder, ValidatorInterface $validator)
    {
        $this->entityManager = $entityManager;
        $this->passwordEncoder = $passwordEncoder;
        $this->validator = $validator;
    }

    /**
     * @Route("/api/register", name="register", methods={"POST"})
     * 
     */
    public function register(Request $request): JsonResponse
    {
        // Decode JSON request data
        $data = json_decode($request->getContent(), true);

        // Validate input data
        $errors = $this->validateData($data);
        if (count($errors) > 0) {
            return $this->json(['errors' => $errors], JsonResponse::HTTP_BAD_REQUEST);
        }

        // Create new User entity
        $user = new User();
        $user->setUsername($data['username']);
        $user->setPassword($this->passwordEncoder->encodePassword($user, $data['password']));
        // Add any additional fields you need for your User entity

        // Persist User entity
        $this->entityManager->persist($user);
        $this->entityManager->flush();

        // Return success response
        return $this->json(['message' => 'User registered successfully!'], JsonResponse::HTTP_CREATED);
    }

    private function validateData(array $data): array
    {
        // Validate username and password fields
        $errors = [];

        if (empty($data['username'])) {
            $errors['username'] = 'Username cannot be empty.';
        }

        if (empty($data['password'])) {
            $errors['password'] = 'Password cannot be empty.';
        }

        // You can add more validation rules based on your requirements

        return $errors;
    }
}


